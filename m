Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460276FCD06
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 19:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318E710AB;
	Tue,  9 May 2023 19:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318E710AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683654738;
	bh=rl0m+S5IR8I3CBiopnrAq473qVGLpC68FosKbOtw03Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=adOLL+QwaNKa4poQ3uMp3SCfOC8hOoXeN8NXl/dQYY2q7g9fOhxnAag2oCg4kpDWA
	 syUnBGbxbLaIctrQklvcD0CNzk6FZOJ0rG5UKdNWn/3FSqOPhArUrGz3LDbSOU0BAY
	 dpXRhZrGa/Vs70LD0lpSDJqclw1b1YUfflDF5U6Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F87F8032D;
	Tue,  9 May 2023 19:51:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E96F8032D; Tue,  9 May 2023 19:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A358F80087;
	Tue,  9 May 2023 19:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A358F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=l4gr2WCS
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ab0a21dd01so916934a34.0;
        Tue, 09 May 2023 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683654673; x=1686246673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/ZoWuYpp3wZJ+N+YVxQmRoj9RmFwGQAsaf/1+HB5Lk=;
        b=l4gr2WCSEd9gOV3ZUSmdRYqYggN3uX8HAhosn7/iQZZGIafG14XIfiWNjhX4ibnQEw
         87YI2M3IkUWvA14to4AUWCgucE/h6d0KfNRBgjXRTP0kiDAxtaK56ml1ra0Ds7xVJRmD
         ajxY8PmFDNJMGsuWfGiUmdj9o9qiMUBDf8TBDtMIVe4zEwclpnFJw0FPS/8D84UvKTIV
         Q+/cBiAnnBg/k3/nMEQsnsb/FJ/hC020KwEtf3LwKM0gOkYyTTtoHpoppvYy834J+PSO
         bbVKabvFOx4VMU9rB/KhDHfsxYr9JwOjpvtFtQdbLVuc3ONBby6r+OIU2dp+O+1d8Zgk
         Ch5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683654673; x=1686246673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/ZoWuYpp3wZJ+N+YVxQmRoj9RmFwGQAsaf/1+HB5Lk=;
        b=Zxnn1TKtdaVJORz8k+RqfSehrkeZA5+MTq0nij6++NGgGgkTSh5OTQM87Y8eLtyXnU
         dgcfQc52kxpSbLIlnBCzYnW+myEJVjsItz7lVDaHgnWosthvkZI4BHPPFoM+0cNfPG5D
         uLcUOcPYv896Yg7ZQSIlfkV2vaj1uTi9LD9klvnNz9jFnbigSbNbKN6n52yzEfAbwtqX
         ql6RJSw7uUfjjOkpk0qacoE1xDOGKa1DcieT3Z5rquY4sPjzXRhP6e7EWA+ZXQoiN+/N
         zQXRFum+lqBfRzof8eR0keWe6e7Q+yCzrc0nlT0jWvvzoDvMGsG7UFfQ1mOPd3YX9x5i
         BNnQ==
X-Gm-Message-State: AC+VfDzcdR5B8Grfk77Mtt34oB2feL/Em4SHFTyxlyw8SBO9E+PGIk4q
	Iz5q7jNT3g/IVe6I1Gg7ogE=
X-Google-Smtp-Source: 
 ACHHUZ7DNNIJzvWelTj0q/jeINPT/Y7CProN3uqQlka3gLCv5WATI32X0wfgh1KVOk8YLA6/ycXA8Q==
X-Received: by 2002:a05:6830:16cf:b0:6ab:19ce:539f with SMTP id
 l15-20020a05683016cf00b006ab19ce539fmr1352548otr.1.1683654673370;
        Tue, 09 May 2023 10:51:13 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a056830169700b006a32eb9e0dfsm5374933otr.67.2023.05.09.10.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:51:12 -0700 (PDT)
Date: Tue, 9 May 2023 14:51:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFqIGCliFRJ3W/ap@geday>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
Message-ID-Hash: WVUIDJ4EMXQ5KK3WLKMISTEI3U7GR4VU
X-Message-ID-Hash: WVUIDJ4EMXQ5KK3WLKMISTEI3U7GR4VU
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVUIDJ4EMXQ5KK3WLKMISTEI3U7GR4VU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 09, 2023 at 09:12:55AM +0200, Jaroslav Kysela wrote:
> I am open to any suggestions, but the default mailman settings (do not do 
> anything) causes that some (mostly gmail) users do not receive their e-mails 
> because the ALSA's mail server has a bad reputation. Many companies are using 
> the google mail service for their domains nowadays.
>

As a GMail user, I can confirm that I'm not seeing any more bounces
after mangling started. Usually it'd bounce and I'd have to login to the
web interface to turn back on my subscription, a real pain.

> 
> 					Jaroslav
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
