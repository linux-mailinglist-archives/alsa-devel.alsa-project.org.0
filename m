Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DEE69A2F9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 01:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDBAED2;
	Fri, 17 Feb 2023 01:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDBAED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676594195;
	bh=Dr7sPxdekubOGhXaC/Mdi8p1h+2sGJHvj1t8ebnC0dY=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HclVor/MeKWBbuTWGXSWUkKlg9X5wHzCgbHLkE2Bf9FsXqYlyR9WHGvGe8ZlfFyqI
	 KapWDhbIwDLO/36+9i5/YUB2ugF5Y3mUkji9469+z40wPheeXMaSlVgWRhhEhNmTY+
	 7PLORjHmTrPb1q9jd+yk03n5Xvl9bG1xBLb+/CDs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A76A2F800E4;
	Fri, 17 Feb 2023 01:35:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 911CDF80171; Fri, 17 Feb 2023 01:35:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57D41F800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 01:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D41F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nddzUPxI
Received: by mail-qt1-x82d.google.com with SMTP id h24so4005744qta.12
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dr7sPxdekubOGhXaC/Mdi8p1h+2sGJHvj1t8ebnC0dY=;
        b=nddzUPxIGeqLTtrhu9EVKCFxOtCsgdttfQBKL8jlSo3Boywb3FvOBviYqH6YNd6Ovy
         nQK4JagLMpujbYsfMkxHM74+gJP2lYYj+K/0jjQZscSlxj+iXXEHXWYiGvS79FvcnePv
         +zhjFAUjnPjnrAnPWLlQfTc12FdKwGbcs9OK3m6LgOAyyRZeVYWB75B2CpCsD5olEIXO
         vXJKTAIrd/xkW3IuSJuklIa/SZnXhSY5QhU3d0qQL5q7l5vsC0l90zleOgr3QiQX3y1Y
         q7z1o7gUu7Nc8jrv8JvW7dkKnvMhIf5ozpNZ4x+3JZCWV3EUaGpMXv/c4Z7vAEq5jhXV
         3B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dr7sPxdekubOGhXaC/Mdi8p1h+2sGJHvj1t8ebnC0dY=;
        b=43RSPu7DXtuk6U2QYU2H6yDEeFsD0qbh024o9hYolu0IIDGFNNbhfZjrssa6nuKKm1
         0sipKG56zUG5GXUsW/TJVx+5BEcq+l7WH5GsMXCWxhd7KphMMwjyHpKwvtbXpSnXV4z9
         vfkT24q1WMNK5Ty2se8Usz6WgQSU1muwUn7tRzGiN5an550+X4rzmskJqYzdh/Z9mvPX
         Orv7sLUNaML4X1cwdf5RDk0lEJf+CkA1jJ7pLHwcw4OmmIx44K3LDMvZADI8CrS0bvVq
         D2JSngMvMpbGPVaj6j0xyYqT87CTYcnyKi45K53BCER1VGpynyBFw8VYLQcByYsn7+ip
         He6A==
X-Gm-Message-State: AO0yUKXluEWS5huRaSHflC/Gf1wVPtLDAuaNS7JNo6ptB9Y08s9r8ZdE
	MZNzCm0jMr7MEEbLmqgq3EQ=
X-Google-Smtp-Source: 
 AK7set9fOWzgg5dxOQFFZT2Mi8yNhyEndcRW+3jKrBaDc9Gq5iZjBh665zQr4Y6uPod5NHO+ujyEzw==
X-Received: by 2002:a05:622a:28b:b0:3b8:5ad9:3fe8 with SMTP id
 z11-20020a05622a028b00b003b85ad93fe8mr14198725qtw.48.1676594130283;
        Thu, 16 Feb 2023 16:35:30 -0800 (PST)
Received: from ?IPv6:2601:14d:4e80:336e:6940:faac:fba5:1dee?
 ([2601:14d:4e80:336e:6940:faac:fba5:1dee])
        by smtp.gmail.com with ESMTPSA id
 x1-20020ac81201000000b003b9b41a32b7sm2188523qti.81.2023.02.16.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 16:35:29 -0800 (PST)
Message-ID: <ab7432c0267ade5f5c07f69c5a3bf8ac3a8d421d.camel@gmail.com>
Subject: Re: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to
 quirks
From: Joseph Hunkeler <jhunkeler@gmail.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Feb 2023 19:35:28 -0500
In-Reply-To: <Y+7GEp06snoDjrH8@sirena.org.uk>
References: <20230216155007.26143-1-jhunkeler@gmail.com>
	 <Y+5Ym5rUWLK4TOAf@sirena.org.uk>
	 <224b230c5c8d3037b650602b5743bbf217369ecb.camel@gmail.com>
	 <Y+7GEp06snoDjrH8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Message-ID-Hash: 64RVEK7B37FNVNK44JZILPP3WYI3ALKO
X-Message-ID-Hash: 64RVEK7B37FNVNK44JZILPP3WYI3ALKO
X-MailFrom: jhunkeler@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64RVEK7B37FNVNK44JZILPP3WYI3ALKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 2023-02-17 at 00:10 +0000, Mark Brown wrote:
> You'd need to resend to fix it but I'm saying there's no need for
> you to bother, I fixed it up locally.=C2=A0 Please just bear this in
> mind for future patches.

Ah now I get it. Will do.
Thank you!


