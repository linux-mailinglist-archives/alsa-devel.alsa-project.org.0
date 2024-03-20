Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A091880A30
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 04:44:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096FFEB1;
	Wed, 20 Mar 2024 04:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096FFEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710906286;
	bh=Gy9z627tun6lRZjc9jYguxsNXGaL3VzJ7LMkrUA7mMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qjhj7e4ahs+Rz1mSxsz6qN/CDK0HtxdTvJrsZ7TWBE0iFGiqPHY45BTJemkzgBBuz
	 vSRA0dR/7ajswfKD9raSEsrcUKGXjKEwUgmLaLbegvtyuBHy7sfXiR7DhvhU0H0AKY
	 uF3g0+tQiaAtbLklku2lMKGdowgYuFuU+yvvHlVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38C0BF805A8; Wed, 20 Mar 2024 04:44:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B51F8059F;
	Wed, 20 Mar 2024 04:44:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C47D4F804E7; Wed, 20 Mar 2024 04:40:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E998CF8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 04:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E998CF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cz1f+Wek
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5dcc4076c13so356391a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 20:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710906008; x=1711510808;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iq0AhKc5ZISVBalh/p7W2VFlDvbkWTKRkeP2Jxshumo=;
        b=cz1f+WekbAtd6o6V7wGT7MG0i4TnI6/fIyfchF0NeNatSj8M0mS9B1BDjqP4yrjX+q
         DB3McLGsFmu5yKnGa0mx8EHotkk1acBV50DpDQXM+amM0+CHtYJdNDU7I/S3TOhMPawW
         Kjsv+SZu/q1gKJVJ9wpIglzmIpmykjw+pkvh1w8d1kgn249NpMKIy3UWrDMKmhTBzG4Q
         LI6L98/vwSw0zkgLoPchqBh8pMqy35f2vib8iQD8j1C4+p4QcHdJ09M3IlqifkeIfgcS
         tECWXKT3dP1Tj4qG367WRJ/l3D554KF7OZT4QFS0IQ/976y/7fcwJ9Om8ApDhWd8zlLP
         o+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710906008; x=1711510808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq0AhKc5ZISVBalh/p7W2VFlDvbkWTKRkeP2Jxshumo=;
        b=PkiGyW4snHY934ouCIq3mlPl3tF9bvQ20DRks4FRe8SW159D/MTTHIuWzlQk0anZIj
         H5tq3fqwK+02cTrdVSS6fRhwwYBl3d6PVBAn6LIjA/OWSBhSSwBB3edGoivYzWTzfT83
         jv3UxA+3PnmHIcPihCsiezpggx/2PeKbrm8666snCPJxwNrMhJsJ1bdTyTw9JN3MuDL4
         ZgbvrygvS3DIjTF8uig77Z55slQZxjOxYviRY3zxFn1FMEQwIglo0uFo/8/TpuggeJxf
         VdrRukAT5AwfNR/u+9aH0lMlmzu4J3o8qTDpC+90XByaBaQX8FWiIMZ2Cds+ZtUGYmJW
         5YrQ==
X-Gm-Message-State: AOJu0YzIXVbLWlHJQ870MPnq9a16/KrNFSaW/gmQS0/dzhqt1QUmYTS7
	+oFZzv3+i/fOR/A/zawB53m73Qe299xs3zocIkaMxtX8SuP001kQ
X-Google-Smtp-Source: 
 AGHT+IFZD/MeXs2E6uUZrXCQ6X17F1sBekp1MV9WfunJxtX4YZdYMidrvWT1RJP/rlLB/1TrLfDUQg==
X-Received: by 2002:a17:902:c412:b0:1dd:e403:a082 with SMTP id
 k18-20020a170902c41200b001dde403a082mr1817538plk.1.1710906008149;
        Tue, 19 Mar 2024 20:40:08 -0700 (PDT)
Received: from geday ([2804:7f2:8006:26c5:8cf1:fbe4:ce31:77e9])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a170902864600b001dd64048f78sm12221870plt.211.2024.03.19.20.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 20:40:07 -0700 (PDT)
Date: Wed, 20 Mar 2024 00:40:03 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: marcel <marcelg@gmx.com>
Cc: ALSA-devel <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] Add Asus VivoBook S 16X to quirks table for acp6x
Message-ID: <Zfpak4MeAusZUePK@geday>
References: <655fb630-e5a8-4993-8706-085476c7fe2f@gmx.com>
 <ZcGbWHRJ9ewRvAa7@geday>
 <1b37b9ee-68db-425c-b878-71847459fb3c@gmx.com>
 <7bbc4afe-30de-4342-953d-2cddcb3c7933@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bbc4afe-30de-4342-953d-2cddcb3c7933@gmx.com>
Message-ID-Hash: BRYJFY5M3R46VLQ4RAI2A377KRT5UH3H
X-Message-ID-Hash: BRYJFY5M3R46VLQ4RAI2A377KRT5UH3H
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRYJFY5M3R46VLQ4RAI2A377KRT5UH3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 19, 2024 at 05:16:10PM +0800, marcel wrote:
> Hi again,
> 
> it's been a while since i sent my patch and I still can't see it in
> kernel on github, so there's my question because I'm not sure if I
> understand correctly. Should I just wait a little bit more and it just
> takes time or send patch again and change things you pointed? Also which
> version should I type after [PATCH v...], "1" ? Because it's my first
> attempt? Sorry for taking your time and if the questions are obvious,
> but it's my first time doing something like this.

Hi Marcel, please address my past concerns regarding your patch and
resubmit as v2.

Remember to Cc: Takashi Iwai and Jaroslav Kysela besides linux-sound
mailing list or your patch will fall into limbo again, overlooked by the
maintainers.

There's also a get_maintainers.pl script in the linux tree. You might
wanna use that as it adds some relevant people who might take a interest
in your patch.

Thanks,
Geraldo Nascimento

> 
> Greetings
