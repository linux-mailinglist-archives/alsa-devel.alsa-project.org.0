Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D8B2D8F8
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Aug 2025 11:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36967601B3;
	Wed, 20 Aug 2025 11:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36967601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755683240;
	bh=1KPpiQ8hagVxzaGyCUhCv9U4Ry9vUGyyrlz8+xXpZfc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MXktUIaiGlf6AYMXSu1eroEd9gwaw8/R1lpXv90M61NqNm9tekeJ5YspaYhRp0KsY
	 5cLXE/U/IeRmEoaJug2ziPgoyaWEgS7YplAl9s6Ar1dOkBERsOoeYA0PnW/quyymEs
	 w2aTrWvTfMl9lZfEcTJipU5otzyijbG4+BJ+9i2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D4E0F805C7; Wed, 20 Aug 2025 11:46:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA85F805C6;
	Wed, 20 Aug 2025 11:46:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B340F80185; Tue, 19 Aug 2025 17:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C93B4F800F8
	for <alsa-devel@alsa-project.org>; Tue, 19 Aug 2025 17:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93B4F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rV6L6gj8
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b9a342e8ffso3792311f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Aug 2025 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755616152; x=1756220952;
 darn=alsa-project.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=rV6L6gj8i1Mkmm5GekN3sqzdTp8/KxkaKTY18UxrcBX7Ru3FGLN6otkr+OMjNtdr/R
         9H4bo0xl7pdsm15b/pi4DPWshgN6HXeitqG1EeuTmVy/4lBdio6srrbxDCnqmpiP5b6S
         r0D18KvBrwo3dleoLB0SeEMHys1/0WXWey5P+NoQLqk9nFKIksXXYdAg9yk2dD/MUujZ
         PC9JHSiCaRPEdY3Mc3BGlaSBxOROuv6Fgg8SvcbLKX/nu67veUFiTiQmzuc0Zx50Xln1
         RnQZrhzl9xgBqBEUbkSO15Pq6ZaN684quwFvX+L+P7b7QfgpIGfSwAog9fDLHlN7bu9B
         9QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755616152; x=1756220952;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7UPGoC7p7M4ZyxE/iJKUZfCO9/xK4vTK1yfysENQ4=;
        b=bam8v6lv4DJyLmPTWCeMt4oAaRBOE18oI4jcU298Jgozz0hS3QhjvvcEiQf+QN35Qi
         BVpz2cdcegjoglvi9rVEPoJvD2w9wOkJgd5mS45Yo6LAdFdHDgs7aV3Bl0WMPHigVhpe
         KLgsjxgLj1yepYc3DZfqDGLcKtmOFeppQcyjdfYrGkq20C/b4BGl/YDsLoYOmF3TyHnP
         CdaIYjPRhUZsvLSYRFp8uDUeXAOnlEQZjOudgn9VuYbaJGwxa3J05gIOHexVLbGIJVzI
         fput7BMiFRqrHUYkjPVII9+KZ2CfJ5GF3l9s3X1eKA9EGuD8L0ne+Gd8Tu/LnrWm1/oh
         h9vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNxQw7mmqnla3zK7g0anRpgG/fggqxnb+od6rrcD8Vjuyva/1rz9ono3dNV1cgTHiYps4bGCMvJjI2@alsa-project.org
X-Gm-Message-State: AOJu0Yw+6M4jEoIv0OJAh183ayKLoHdHoYi05RcS4UXjz/0p5sbc1jRr
	0kRvkG9MpYdmZzTE9rGULpBVt77QBr2RFRKsMy3TD0BZ/y5/WVmeRXvF5fb0fslS+aE=
X-Gm-Gg: ASbGncsUDNrrG5YFMrwhknd8odN0S/1cW/SjbJPUtr0KsgefuDqfaS9qVaguvkXgwnT
	dOJsswV1PQOV3tbjD2VnteuElO/RBIANXqYpjF0k5S9NkqfwtIPOfV9NaiNe3itLcwlcysCTftM
	VRhPTS9/MjjfTz/XRGZ8AFAyDwvHPZhF6N6eyqH2gpD6+FX5TLGZCsCVJERUEpakumEwAzTX6Hz
	N7d4+P8ro/QUTbHnWiz3ZV+3Jma+eMDdMEtaT1ZZZzg4UA1ZJNDGAmy2D+rRaNxpgwf+fFZgemB
	9a4vIKtSvRElvJHUAvJ7SrR4i3jqM30TjMaUDW9avI4PrIR5WlibNs5JWEg2PNBa6oQPWsydkLT
	hGyypRRfzwcCGZD738aOK4YzdNNR3GmMPgVJUG5PMjKY=
X-Google-Smtp-Source: 
 AGHT+IE1viNjLGpD+HAtjEJG/zvJFF7kbam/xqYb7DdBJ1k+xCzcfb4DF0qP9aBktmah9XbwoOkVFQ==
X-Received: by 2002:a05:6000:18a5:b0:3b8:d8d1:1e72 with SMTP id
 ffacd0b85a97d-3c147fbe074mr2435307f8f.19.1755616152531;
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c074d43c77sm4218240f8f.23.2025.08.19.08.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:09:12 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:09:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 17/18] sound/usb/usx2y/us144mkii_midi.c:65
 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be
 null (see line 54)
Message-ID: <202508192109.lcMrINK1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GMRVVUGMP277XD6KWFORRJ7J5AFJFGJJ
X-Message-ID-Hash: GMRVVUGMP277XD6KWFORRJ7J5AFJFGJJ
X-Mailman-Approved-At: Wed, 20 Aug 2025 09:46:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMRVVUGMP277XD6KWFORRJ7J5AFJFGJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   d9f0633867711cff87c5604a4f90daa8ab986e4f
commit: 0ec417aa85467c6fad0563621b74868be0faf00d [17/18] ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192109.lcMrINK1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508192109.lcMrINK1-lkp@intel.com/

smatch warnings:
sound/usb/usx2y/us144mkii_midi.c:65 tascam_midi_in_urb_complete() error: we previously assumed 'tascam' could be null (see line 54)

vim +/tascam +65 sound/usb/usx2y/us144mkii_midi.c

67afec157fe63d Šerif Rami 2025-08-14  38  
67afec157fe63d Šerif Rami 2025-08-14  39  void tascam_midi_in_urb_complete(struct urb *urb)
67afec157fe63d Šerif Rami 2025-08-14  40  {
67afec157fe63d Šerif Rami 2025-08-14  41  	struct tascam_card *tascam = urb->context;
67afec157fe63d Šerif Rami 2025-08-14  42  	int ret;
67afec157fe63d Šerif Rami 2025-08-14  43  
67afec157fe63d Šerif Rami 2025-08-14  44  	if (urb->status) {
67afec157fe63d Šerif Rami 2025-08-14  45  		if (urb->status != -ENOENT && urb->status != -ECONNRESET &&
67afec157fe63d Šerif Rami 2025-08-14  46  		    urb->status != -ESHUTDOWN && urb->status != -EPROTO) {
67afec157fe63d Šerif Rami 2025-08-14  47  			dev_err_ratelimited(tascam->card->dev,
                                                                                    ^^^^^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  48  					    "MIDI IN URB failed: status %d\n",
67afec157fe63d Šerif Rami 2025-08-14  49  					    urb->status);
67afec157fe63d Šerif Rami 2025-08-14  50  		}
67afec157fe63d Šerif Rami 2025-08-14  51  		goto out;
67afec157fe63d Šerif Rami 2025-08-14  52  	}
67afec157fe63d Šerif Rami 2025-08-14  53  
67afec157fe63d Šerif Rami 2025-08-14 @54  	if (tascam && atomic_read(&tascam->midi_in_active) &&
                                                    ^^^^^^
Is this required?

67afec157fe63d Šerif Rami 2025-08-14  55  	    urb->actual_length > 0) {
67afec157fe63d Šerif Rami 2025-08-14  56  		kfifo_in_spinlocked(&tascam->midi_in_fifo, urb->transfer_buffer,
67afec157fe63d Šerif Rami 2025-08-14  57  				    urb->actual_length, &tascam->midi_in_lock);
67afec157fe63d Šerif Rami 2025-08-14  58  		schedule_work(&tascam->midi_in_work);
67afec157fe63d Šerif Rami 2025-08-14  59  	}
67afec157fe63d Šerif Rami 2025-08-14  60  
67afec157fe63d Šerif Rami 2025-08-14  61  	usb_get_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  62  	usb_anchor_urb(urb, &tascam->midi_in_anchor);
                                                                     ^^^^^^^^
Unchecked dereference.

67afec157fe63d Šerif Rami 2025-08-14  63  	ret = usb_submit_urb(urb, GFP_ATOMIC);
67afec157fe63d Šerif Rami 2025-08-14  64  	if (ret < 0) {
67afec157fe63d Šerif Rami 2025-08-14 @65  		dev_err(tascam->card->dev,
67afec157fe63d Šerif Rami 2025-08-14  66  			"Failed to resubmit MIDI IN URB: error %d\n", ret);
67afec157fe63d Šerif Rami 2025-08-14  67  		usb_unanchor_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  68  		usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  69  	}
67afec157fe63d Šerif Rami 2025-08-14  70  out:
67afec157fe63d Šerif Rami 2025-08-14  71  	usb_put_urb(urb);
67afec157fe63d Šerif Rami 2025-08-14  72  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

