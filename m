Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB78ACD33
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 14:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26899DF8;
	Mon, 22 Apr 2024 14:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26899DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713790033;
	bh=Ozo7BcATG7EAukIL81V6IzUsbkPqptA/zQ1ktuKfe3w=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M6rVrdmaW42/WQCvJx1dCnzjPPcQOPCflvkTr54UjMVFC/5pFSOGXU4nqXr/OBtB6
	 Y1h5bz7cQrte/IGwdw2oJuKbcGg2/46JgcT+vyxxvurekFYP5F6UnrOCW8io/jGGM5
	 xqJ3IkuzS/XRGFBf68B9r58QgnhaxIuRiFQN/UmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46DA5F805AC; Mon, 22 Apr 2024 14:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C53EFF80579;
	Mon, 22 Apr 2024 14:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE27BF802E8; Mon, 22 Apr 2024 14:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5CBF8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 14:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5CBF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YYUwEPxs
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34b3ef55a86so421874f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 05:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713789988; x=1714394788;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q0n4cgcy35e+PoLL2c0MZESh3f/cFfTbbl7okJJjUOg=;
        b=YYUwEPxs+ARrkbSkUal1C4XCM3D1dbNe2WWBx6Zj26+5gxTVOazrANeTcoKRNeLYap
         lqnE6GOxDp1YfNU+QoiCf4NahIjneQpvKOBX+Hn+zla6PKMU1hCZCoLaBtXoK1rFqLZA
         GFo4RJBNXScY/hF5OB+pNnHSSp2rBo9Z/0oKo1U7Clg/L3hGWf4LW9AtEzVwAzXRqfv0
         rOPRQTqkDAJ/la69aE/q0JY7Ey+yNIIXEHMUE4ArEM/sBEP+wk4bOHC686Xs3H6ykj2v
         obRmiYVNrfkWCqzFaNDOq0GhvlZOVNAjTwKSNw9pemAzWdI8slCZBRateQSvI6tIRJXR
         vb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789988; x=1714394788;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0n4cgcy35e+PoLL2c0MZESh3f/cFfTbbl7okJJjUOg=;
        b=A3n350quE206CvH91IJaYzPa2qImDupYpgxbsai/I39jIIRLT9+DIxXvtcrY+mMj1y
         A8lEY/Tg+7tBaICCN3wDXkSqS+QvFZBhHo4ts14eNPZNJEzCBSJ3h5mED1YIuSccZHfz
         THGdQgrYVB0Vt8PbA55vCKKsWK5nNDgcUK3ivoXgtTfcU/upBNqlk3/x3SRcDDy0+7Zk
         +7rFcGBKdLr0sod7nbQdqtRogrDRNBEiIvksKBYz51HMHcmpOIEfKfq4rgw2+5O1mXjg
         p0/q+eUA1D234TA5FvqeUIsAcRsbqQVTConSxieLfbdzdNx81itY9XJAMK5NPURRUBuO
         y0Ig==
X-Gm-Message-State: AOJu0Yzw+z3b/7VcXERK9yh79x684eRqgezdWUAKQ9Kowiurpe0zcLgB
	ljvhZZGnWDsS0v4xWTfa0Te1/yARTNb6Q7RGDflga+oXw5miFXoasNYu4G/n0sscpThZSbBBlv+
	6+Y8qD3L6N2g3eXMGlbvSuZwCD0uy7/aKkrw=
X-Google-Smtp-Source: 
 AGHT+IG7fRBZdjXuuR4zCN2w0hEtEpOIU1Xz5dYWaieBzBgZgwnkcH6hcQcAoSYNfscDm+HgN1Yo6bey4aJlfpGaUmk=
X-Received: by 2002:a05:6000:c4a:b0:33e:d865:41f with SMTP id
 do10-20020a0560000c4a00b0033ed865041fmr5202488wrb.35.1713789987855; Mon, 22
 Apr 2024 05:46:27 -0700 (PDT)
MIME-Version: 1.0
From: Jaime <enopatch@gmail.com>
Date: Mon, 22 Apr 2024 13:46:16 +0100
Message-ID: 
 <CAAbCkmLGdbfsN+PXsOr8nV7rY44vvxV8y7jN1cxOr7wfsGeKwA@mail.gmail.com>
Subject: snd_hda_intel with buffer_size set to 32768 sounds horrible. Kernel
 driver bug?
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: YSGPENFV2BTRZNIG4WWOHNFBNRP4KDDE
X-Message-ID-Hash: YSGPENFV2BTRZNIG4WWOHNFBNRP4KDDE
X-MailFrom: enopatch@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSGPENFV2BTRZNIG4WWOHNFBNRP4KDDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fresh Debian Bookworm (v12) installation with alsa but no sound
server. aplay with no .asoundrc sounds great (default buffer_size is
16384). If I force the buffer_size to 32768 ([1]), then aplay sounds
horrible ([2]). Is this a kernel driver bug? (If yes, I'll log it at
https://bugzilla.kernel.org) I discovered this bug because pipewire
sets the buffer_size to 32768 hence it triggers this bug - I've logged
a bug against pipewire at [3]. Output from alsa-info at [4]. TIA.

[1] To set aplay's buffer_size to 32768, I use the following ~/.asoundrc:
pcm.!default {
  type plug
  slave {
    pcm {
      type dmix
      ipc_key 1234
      slave {
        period_size 1024
        buffer_size 32768
        pcm "hw:0"
        format S32_LE
      }
    }
  }
}

[2] Upload of horrible sound at
https://audio.com/jt-1796478503182974/audio/alsaonlybuf-32768nopipewire

[3] https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3966

[4] http://alsa-project.org/db/?f=5dbfb02c81bb1523505c725a189b6f0133f2b3d7
