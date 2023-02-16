Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587CA699EFC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 22:26:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7116BED6;
	Thu, 16 Feb 2023 22:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7116BED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676582812;
	bh=UYVK+TYQ7T+40iOERLRbI3lik8ViyoScUmSDe4nEJPQ=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B1I7gNeNbIOC1iC8cQVlqOfJPMEZBjYSJxG+SC6x8BxjfqgL6f5hKmY2wRb1UC9Do
	 mdUlfqLokvLBehK1/Q3Yw1enmi0bf/a4SbyOvyYr7rGFaOE9PL6keQLmpmTbPbcZ5X
	 70IsKtkmess5WT2VDpo4LxIuxc22AXZlQeQXr/GM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6753F800E4;
	Thu, 16 Feb 2023 22:26:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BBB1F80171; Thu, 16 Feb 2023 22:25:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA99BF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 22:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA99BF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LW2JpHUX
Received: by mail-qt1-x831.google.com with SMTP id t16so1153987qto.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 13:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UYVK+TYQ7T+40iOERLRbI3lik8ViyoScUmSDe4nEJPQ=;
        b=LW2JpHUXRf42KNNf5rBSmJp7D8Shg3U/PrdW5zCQupgqF0nBNH7gF//pYiA1YI03n+
         N8XZHW3iRLRhTHV93G5VzHzR0g5rTzQBXe4SizZuve8U0/+9ArVTjU+C+eKyHKxNwbfR
         Wojm21r5gHfeoRaaCsjd8tBYqkMrHXIDKJSSqz5dcYpd2aps8Wh1lxC+a7+lMpZMf0s6
         +pdZAaAzjK6IgV82yupRMnYqq+zFbw6yGbfHXjjl7y8HRxyV6TOTZEj4SMXYKjD4LMu6
         TfzLp837TMVXLVfbYghor9pYuCXveQGt3Z5G4GKqnb6oUqm5YBwjykOrCPwhezL+rxLI
         MKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYVK+TYQ7T+40iOERLRbI3lik8ViyoScUmSDe4nEJPQ=;
        b=eEYs8D6tAf7ZkvElXXuzJV8mTyxWpqRLUYoJ4pQ8wiVtTKkYOhGg+h+5+3kDe9WRce
         2hJwoHuhx8OBmI6JP+VkwpC5FS6tm/27WqhEMEL2HSwRYB/4wYzzNyMkWhnKVeVOCQ4r
         EBIF56yuSowPOwrH9ssMJ9nbe3P6ltbRj7a1Ot3b0lmd1/nwh1kFXXgzcDKwbVZDER8i
         uARVq9uxXqyNXbyITlUlmkra4fD0MsgfpiWIJ3D8IdagWE60lLfk+KzOYhURPkL8tGK9
         jK9u2d4xVpEAV8cpVDMIhLP+DBlKSGw6v2/LnLXFIW9o0lpXAeP53EaeSLlYnBve+cAv
         h4OQ==
X-Gm-Message-State: AO0yUKXo8wsGVA+HEAc+RHujQLkjYSUnvCJZI3DQqMuYu8yhoB57zFCv
	vg0U/ZMT+ZtlAkN50qtj8jg=
X-Google-Smtp-Source: 
 AK7set+vcFZvHrIiQKOiLL2FaV0aJNClQyghLwOyIquAsrom4y6wsRQEvwHru8STblU0rgR3pM2NNw==
X-Received: by 2002:a05:622a:607:b0:3bd:a75:1b9 with SMTP id
 z7-20020a05622a060700b003bd0a7501b9mr4697541qta.41.1676582746643;
        Thu, 16 Feb 2023 13:25:46 -0800 (PST)
Received: from ?IPv6:2601:14d:4e80:336e:6940:faac:fba5:1dee?
 ([2601:14d:4e80:336e:6940:faac:fba5:1dee])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a37b304000000b0072771acaf09sm1907424qkf.126.2023.02.16.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 13:25:46 -0800 (PST)
Message-ID: <224b230c5c8d3037b650602b5743bbf217369ecb.camel@gmail.com>
Subject: Re: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to
 quirks
From: Joseph Hunkeler <jhunkeler@gmail.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Feb 2023 16:25:45 -0500
In-Reply-To: <Y+5Ym5rUWLK4TOAf@sirena.org.uk>
References: <20230216155007.26143-1-jhunkeler@gmail.com>
	 <Y+5Ym5rUWLK4TOAf@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Message-ID-Hash: FON222S3TESMN52ZJXI7KLR7J4NU5O5X
X-Message-ID-Hash: FON222S3TESMN52ZJXI7KLR7J4NU5O5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FON222S3TESMN52ZJXI7KLR7J4NU5O5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 2023-02-16 at 16:23 +0000, Mark Brown wrote:
> On Thu, Feb 16, 2023 at 10:50:07AM -0500, Joseph Hunkeler wrote:
> > Enables display microphone on the HP OMEN 16z-n000 (8A42) laptop
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Hi Mark,

I apologize, I don't fully understand what you're asking me to do. I see
the typo "yp:" was supposed to be "yc:". I took a quick look at a few other
submissions. Are you suggesting I change the email subject from:

> [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to quirks

To something like:

"[PATCH] ASoC: amd: yc: Add OMEN by HP Gaming Laptop 16z-n000 to quirks tab=
le"?

If so, do I edit my original message as new, amend=C2=A0the subject,=C2=A0a=
nd=C2=A0resend
as-is? Or do I reply to the original message with the amended subject along=
=C2=A0
with the full contents of the patch body? I know you said there is no need
to resubmit to fix this, but it's is not=C2=A0clear to me how to do it with=
out
resubmitting.


Thanks,
Joe



