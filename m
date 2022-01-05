Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F81485493
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 15:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3B911930;
	Wed,  5 Jan 2022 15:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3B911930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641393141;
	bh=89A95LCMnDJYz28tITv5/lI+onRbDPPGvlW1jq2RNEs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3dfMbGceZ2+QGdvuoTlT5yNvGVEzxncH9AVRMd8pa6YOxWGLgW4YYPRs8Mcelsnv
	 0yLbrHdXSju+Tj1pqMrXvQgRUZo3Zb9j6hBdMMyvy/Pb5F3si+WaYbl7jK+UG/35uN
	 wbxPI210X4Yk0vLkglTRkI2vZtSDm7PMxxAWFtdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48B29F80227;
	Wed,  5 Jan 2022 15:31:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C83F80227; Wed,  5 Jan 2022 15:31:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 750C1F8007E;
 Wed,  5 Jan 2022 15:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 750C1F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gn50BGVb"
Received: by mail-wr1-x42b.google.com with SMTP id h23so490579wrc.1;
 Wed, 05 Jan 2022 06:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=89A95LCMnDJYz28tITv5/lI+onRbDPPGvlW1jq2RNEs=;
 b=Gn50BGVb2UovPoBBs0ut7sO18C30P5JOAbcdP/JKWW9CvUFf0I4Tzdioz6yVnVGl1p
 5zF7dh7+GYWS9x3pcu2OSa6NOLZbfxIMQw/rJArNtGeio6BHUhILusE/3DudZG24cz+E
 eq8T8KvEkw1kJlfKvmDEvjW+CHDgLy6E3ZV2Peyu6T/IO/qewFtYUMigpELz0Z7/XeCL
 u730UAWEWjYG4WbzwezVFbNAmv0CEbCtooOeB2MSwSSnyeP7hZWyOOv226DPNRSWWV2n
 qxHzJsutCg8jq3sSjQvtTB/KyDXSbZYh9t7s1RJ6LRB0FhglEhYMKqdaQMP3iTJxLTVy
 uiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=89A95LCMnDJYz28tITv5/lI+onRbDPPGvlW1jq2RNEs=;
 b=yo5yTZRbifS+lg0COe4xf2/wQSnmis+NtdBQ9rhn4MqSf0uWwkE3X5Rdm46G/ls6UB
 g6+Vmtc85hAwbmUaoJDPXTnVR4rB1Y3lnaGfiI6OBD0GqS1J1kM7MG371TUmDTDs6dv3
 R6ZKpHUGn+BRrKFX0ukWJwE9TjWguylmUVd7rQisKuO7G92M0LuHPNMg3RTbOOtcyTUU
 htTUXrE++MItL6OUTAGXTfjwqg6FnZjzXhtfq5TBoTFj0LcyELApbjuIxrON7ds8wh+h
 nDva83aiKkoSkZr2af5giV4mUjmDwoDEZKoJslwHyH7+JlwuWDMSPThHF3/eLRfcKZSB
 bKNw==
X-Gm-Message-State: AOAM533NRUpVvfzgZwqBzB2L+WsfcOJrgnduMdhF8OwsuF3eZO7BCA1p
 F5oA8cnNe1McL4msZZOlGaLw2xR1Gz2G1Sv+K7+Mp7G0
X-Google-Smtp-Source: ABdhPJy/LQw8MDuIoky3FCXcVb4ev+mG8Q/aTHLWQgXKDIHU9LggeKo85HND5BCsdN/7juQ6MvbJ5JD1o4zqq7GngUk=
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr46293259wrp.130.1641393076336; 
 Wed, 05 Jan 2022 06:31:16 -0800 (PST)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Jan 2022 16:31:05 +0200
Message-ID: <CAEnQRZB3gp3DwemnTwzbq78pxxpeU-TR=KjSKxgWowFmf+_bXw@mail.gmail.com>
Subject: Handling SIGTSTP (Ctrl+Z) /SIGCONT/fg with aplay/cplay
To: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org, 
 "S.j. Wang" <shengjiu.wang@nxp.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

Is there any quick document for handling Ctrl + Z with aplay/cplay?

I don't see this signal handled with alsa-lib or tinycompress although
linux kernel offers PAUSE/RESUME ioctls.

What should be the expected behavior?

thanks,
Daniel.
