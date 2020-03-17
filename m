Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3DC187B4E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 09:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C56B71847;
	Tue, 17 Mar 2020 09:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C56B71847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584433851;
	bh=2UiAZWEP1LWNNt/QOPgpoYhFPGiwVU78neopdk8youQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eQ5VBb01bYvB0cu3c3kvaeb4SKmOOAVDWBo4jXGZeFTbRhsUmugt01jXcgOII+zs0
	 mSybmXFpbXi08ce1fwsKtGg8IYFePDgKoCetpMB9txUk7Q4CYBycuBR6ZEvH3oH8Me
	 8BAmc2jf1fFS8C1jJq6FvkhHxI8WJqXQ8T91YAZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 944F3F80232;
	Tue, 17 Mar 2020 09:29:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F3EF8022B; Tue, 17 Mar 2020 09:29:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B75AF80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 09:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B75AF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="aSNejnAS"
Received: by mail-pj1-x1043.google.com with SMTP id bo3so8748355pjb.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 01:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wp49eG+mgt94Sf8OotuurBq01cQ7kmd6Td3YpYWcZnY=;
 b=aSNejnASf5mtNy+7z5yy1Ul5UP6XqQ246NFpAeHvn9PFhcUV8DSwR3FwPahRoqPBMN
 eikDVrHtDyogY6R0VE2RhdQA+Sm6dBjaWmYgJi6XoQg6J3KL25J9Aqxn8b+tyW33efEO
 zM7EXFptBn3W6f9T6t1m/Gcr+ZsMiuLjchNm6PX9FSBGroSdP3NratVkmfl9s78vbUUE
 Rhbgtt0KHQUxFBxccGfIoP3TPvOQVbx3Xh6MHiqHL60CcEqocAvSlJ3Ygy19BpnvTNn+
 WYJ0CdGKX3QUtsoZEeMB51yALEal8/Vuozt17JHdCOom4s8aVqbW3MKnyWXxq72Y9pQe
 cg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wp49eG+mgt94Sf8OotuurBq01cQ7kmd6Td3YpYWcZnY=;
 b=aHvG6xK5wH+0Ik2uruu6enQDtnpQF/LzZe5ZZ3mCAT1SyOHg0rIBqSd0DLEZ1K4QoR
 5lpiza06XHJ6ljI3h7x4Lz2UHPLwY+RTsnAdxdmPO1gNFJbjnqCf4zlskIDz9+ffP/47
 v5+hUPrTkWTGHBo5ufiuOhNEg/pmIfRO16yhLlYsZcUNJ11AxX+ajCBD6S8LOI0C1LtL
 5J8sbO9Ikoe0yPgSZ21SBx5wvZQ6IDYL3nsj14Kenf+p/QnMVnqk9Phu7bXHSKhAAOJI
 BGI3a5edxFRVSSiIALzaVBge4LCFOtG3KMATYvBOl+x4iS8pXbnn9T5ySVNgVMvCoQBZ
 Efgg==
X-Gm-Message-State: ANhLgQ252rXhMFHaAeyP+dyjf+NPlcqbzCIH9GHcD4Z+eUM5p8tBJ3Uw
 CXFTstcYcHF5DXjdhIYJUx89fw==
X-Google-Smtp-Source: ADFU+vuyGkQvDdcATxD0OMwlD0qwZwgEt45StAjnv6dNA1hgaFMp3uWeOX/5JY4BV3CS1ecWSQo/xQ==
X-Received: by 2002:a17:90a:2503:: with SMTP id
 j3mr4205128pje.83.1584433739386; 
 Tue, 17 Mar 2020 01:28:59 -0700 (PDT)
Received: from starnight.local ([150.116.255.181])
 by smtp.googlemail.com with ESMTPSA id m68sm21095679pjb.0.2020.03.17.01.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 01:28:58 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ALSA: hda/realtek: Enable headset for Acer desktops with
 ALC662
Date: Tue, 17 Mar 2020 16:28:05 +0800
Message-Id: <20200317082806.73194-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
 linux-kernel@vger.kernel.org
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

This series enables the headset on Acer X2660G and N50-600 desktops with
ALC662.

Jian-Hong Pan (2):
  ALSA: hda/realtek - Enable headset mic of Acer X2660G with ALC662
  ALSA: hda/realtek - Enable the headset of Acer N50-600 with ALC662

 sound/pci/hda/patch_realtek.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.25.1

