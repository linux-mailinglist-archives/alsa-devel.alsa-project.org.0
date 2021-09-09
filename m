Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7440586B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 16:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4FAE83A;
	Thu,  9 Sep 2021 15:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4FAE83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631196041;
	bh=YQ1c2CkZEr493T45eISSEFUXp3dFVDJWPGhmXM0MmFY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3I3Z4u1A0SVCpIPwdB+bU5U+GjRTUSoFC/uytG1RHDfMZDKx686p+ZlK1x5Hjgbb
	 D4+cd2lBfSnDJzVs2KFEGJu8jogR/eaio+2tjsA50sfFDHwO9ZZlVS9qnejpwIRujw
	 CRs69WwJPY6XF794kBT+UkZm2fpc5SSgYBNx4dgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 295C9F80253;
	Thu,  9 Sep 2021 15:59:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61470F80224; Thu,  9 Sep 2021 12:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BE35F800FC
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 12:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE35F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bSvBSQ+q"
Received: by mail-lj1-x234.google.com with SMTP id s3so2155974ljp.11
 for <alsa-devel@alsa-project.org>; Thu, 09 Sep 2021 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4EswICeTNdVlz0lCtTDJTKenpK87Gn1y+QiA37k6snE=;
 b=bSvBSQ+q9aKXaPLiZBGLV6eWIVCHQJx7LvmIpv/Ab0lAxIW5zaWop6/O7XkxyazW9i
 ugPG+8MysfoLd86WiJxXXjewZUQmiNw6kdgy5tiC5wC9VPvwYHdH6fwBl9vYo1rJWnCt
 y4crv01rJv04Fp5aU4lkdCRcoSIPbW1y8Vdoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4EswICeTNdVlz0lCtTDJTKenpK87Gn1y+QiA37k6snE=;
 b=RBItX+fGQScOn7i/BCNNcaoAZJOZUwiBfD+AEy+UOK10QEU4994Wbhqs34dkeXpwTM
 Yf5gjuNE2Pt2vyBTDRObErHn4goMEqwJcuRJ5pSZHm+srGvED6qnLJdQmfqRe/gyZrk+
 rm6Tlo6Thg8JdAI8FMzcNkta93LwyV3x4xSSohYSwizYU8BCXLnh/5nqRqi+UB6ODKlI
 xFDk74Lj0gQIPTeJcx2AvXO7d/PcMATZsNOoNqQuuoeyb1USu2+4EySkPx4FWojzZa3q
 ABeOI+ccwPDFGPHQdeiIowg7HlpLJcgq20Q/gbY9UBkDtwofFz2QvRC0349Bx2qsjSXN
 oe4w==
X-Gm-Message-State: AOAM5327TLQcKIYL5rPuPB5Pg0p1cOST6THjD+cMvUbwirEBMLMmxg1q
 2vjguKxAs4tV9up02YGQzuE6dDC8eeb0T+iu4N9ExRHTabWlrw==
X-Google-Smtp-Source: ABdhPJzbSptDWWVUKjga4SZgpxW3jeFoo8j5fK8339DuhNQ0cAcQOD4SGG7ulwgnlGdNXJyX/2M5q+yceKM7Vz+M2BU=
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr1575416ljn.349.1631182917473; 
 Thu, 09 Sep 2021 03:21:57 -0700 (PDT)
MIME-Version: 1.0
From: En-Shuo Hsu <enshuo@chromium.org>
Date: Thu, 9 Sep 2021 18:21:46 +0800
Message-ID: <CADDZ45UPsbpAAqP6=ZkTT8BE-yLii4Y7xSDnjK550G2DhQsMew@mail.gmail.com>
Subject: A portion of USB Headsets loses previous sound volume setting after a
 suspend resume
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 09 Sep 2021 15:59:24 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: tiwai@suse.de, Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

Hi

We recently found that some USB headsets may fall back to their full volume
after a suspend and resume. We think the issue is caused by the logic of
mixer_ctl_feature_put
<https://github.com/torvalds/linux/blob/a3fa7a101dcff93791d1b1bdb3affcad1410c8c1/sound/usb/mixer.c#L1396>
in
sound/usb/mixer.c:

err = snd_usb_get_cur_mix_value(cval, c + 1, cnt, &oval);
if (err < 0)
  return filter_error(cval, err);
  val = ucontrol->value.integer.value[cnt];
  val = get_abs_value(cval, val);
if (oval != val) {
  snd_usb_set_cur_mix_value(cval, c + 1, cnt, val);
  changed = 1;
}

The existing codes get the existing mixer control value and ignore the set
if the val doesn't change. However, in the suspend and resume case, the USB
headset's control value is actually changed.

Removing the cache logic is a potential fix, but a better solution may be
to properly handle the suspend resume scenario
in snd_usb_get_cur_mix_value. We may need to mark the cache
in usb_mixer_elem_info to be dirty.

The issue is verified to be reproduced with Dell WH3022 and Logitech USB
Headset H340 by:
1. Boot to OS.
2. Plug in the headset and check sound output.
3. Play an audio/video and keep with low volume.
4. Suspend.
5. Resume.
6. When audio/video is played, the headset's sound output can't keep the
original volume. --> issue "

Would like to know your thoughts on this issue.
