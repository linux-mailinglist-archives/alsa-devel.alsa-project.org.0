Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185128AF755
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC3320C1;
	Tue, 23 Apr 2024 21:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC3320C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900588;
	bh=YJdRcjVkxUm2hwiKXvHvQSOdntNyAMqRQQVJTWBlG0c=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k2Yw5Umrwv46laDPatw99lzRonQanx7gjb6kUafGX9PzFtVGhur7E3S+LMjp3GeIs
	 UYvsW7eW9jbkMg4q8WEfOPfWAUONjwJqrVcMRM/Xr6Rsr7k3vBps8EVcJg/2LLFube
	 CLTr0gBAxN2vPa48g44zDMFM4NneJVCFBQbxQjR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5420BF805B4; Tue, 23 Apr 2024 21:29:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A705F805F2;
	Tue, 23 Apr 2024 21:29:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98AAFF802E8; Mon, 22 Apr 2024 15:36:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E128F800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E128F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lLzeTH84
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a55bd6b9930so93021266b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713792963; x=1714397763;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWSBEbtUyKmsYH3feM/Nch+OBxtGEyTsJZqQrpl8YWo=;
        b=lLzeTH84lLEs+NR+3h/xdm/ByZbu62DfTPMTIGMYVALZN8lEATJZwx0i7tptwEJc0m
         g54pggGi0hOE14+KL6qkot2kH6hgabxagugaAxA0TxlvEWzaAph02X58ed0b39I6jAhj
         3EaKU4tsr6VsuKmJ3Z82YxKzFMNerlIfPUE2RL5OHvvPlgoHlCeEXqoolGSf5wyGT6wc
         uhmAM/YhzoOin9/gyzrczEyXl9z2/ByL+TAnzA6JzWzO2YPnUmYQoxaSihE2KrFRWlsQ
         5QsZTBPtOWEy9lpsj9JzOHFOMr8AqvCU8gDNWSYgL8wmqWunC5XSwpN4jKmgD4LNfec2
         FABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792963; x=1714397763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWSBEbtUyKmsYH3feM/Nch+OBxtGEyTsJZqQrpl8YWo=;
        b=RWoojheai05V7gkvA5DzPZpulGBL1NQrmPBlcNo34UnITuc5ePNK+xfKOz4f7ihs5+
         81cHl0q0ajJWmPVAQU39VLbybjQwBuKdCD96AsD6T0QhlJw6K3ZsNftHu3aLxvq0DFmN
         oMqjdPUIPWHkNU4yAqspDzxNNxNr6SdvSWYTehM7jwWCrMg326Bk3np0WF7ksTZFBxWz
         JTk+Y5PkPRmOib26TEwptyUMmzw+0QcstjY8FZlmSn/VgDYWmKpLPmvnR7zf1TS4XdNu
         ifMiqv8JEIDB8tPNGq9hlAgYzMYivVpkVxdobaH3QCY2vAuJRMQwHI8yqCzivY22iJHo
         /93w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH/dNLyhbDgc78HMjgh87m5813H0jFw9BroQS35bmx6AZqVe1ZJ3pBkm1foNNcCRaDNvUiTVlECOZnfZVu4+ekFq8KyvsshWtbUeA=
X-Gm-Message-State: AOJu0Yz6OhURyfDvi+VIeLDMB/G9P4zJO5sms9qsdb0byLfZQcSxeuML
	BoAJuqptgNjslR/yhqfjZQgXXxHXFuI4TzulJ9e2G/f3J1NWoPgc0KkUMVCC8Uw=
X-Google-Smtp-Source: 
 AGHT+IEyi83+UvddZK0AHc4vdThzvzr8YdWIp3Yd0y+Fquqndt4qpHgZKeOGZ+CH9jooxgzdySwiDQ==
X-Received: by 2002:a17:906:2806:b0:a55:8820:e8b3 with SMTP id
 r6-20020a170906280600b00a558820e8b3mr5646437ejc.19.1713792962493;
        Mon, 22 Apr 2024 06:36:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b00a555ef55ab5sm5748908ejj.218.2024.04.22.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:36:01 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Geoffrey D. Bennett" <g@b4.vu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 34/51] sound/usb/mixer_scarlett2.c:3690
 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.
Message-ID: <575ad887-b156-483e-b527-ccadd37bdccf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T3MJBR2GNYPT4YWQJ33NDDZPUMLWGH72
X-Message-ID-Hash: T3MJBR2GNYPT4YWQJ33NDDZPUMLWGH72
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:29:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3MJBR2GNYPT4YWQJ33NDDZPUMLWGH72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   32cb23a0f911317cdb5030035e49a204aa86fef5
commit: e30ea5340c25d41484d551f61d8c93106989019b [34/51] ALSA: scarlett2: Add autogain target controls
config: csky-randconfig-r081-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201509.mWdaL3xF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404201509.mWdaL3xF-lkp@intel.com/

New smatch warnings:
sound/usb/mixer_scarlett2.c:3690 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.

vim +/err +3690 sound/usb/mixer_scarlett2.c

e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3665  static int scarlett2_ag_target_ctl_get(
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3666  	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3667  {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3668  	struct usb_mixer_elem_info *elem = kctl->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3669  	struct usb_mixer_interface *mixer = elem->head.mixer;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3670  	struct scarlett2_data *private = mixer->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3671  	int err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3672  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3673  	mutex_lock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3674  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3675  	if (private->hwdep_in_use) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3676  		err = -EBUSY;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3677  		goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3678  	}
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3679  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3680  	if (private->autogain_updated) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3681  		err = scarlett2_update_autogain(mixer);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3682  		if (err < 0)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3683  			goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3684  	}

err uninitialized on else path.

e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3685  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3686  	ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3687  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3688  unlock:
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3689  	mutex_unlock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13 @3690  	return err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3691  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

