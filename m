Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B42A634F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 12:31:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098C0169C;
	Wed,  4 Nov 2020 12:30:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098C0169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604489498;
	bh=CUeMNeyDGq5aDj6IErIFvRlTdkIwsICGbFGn/pmJ7jU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=id4rIzjnHHg5+lzslYS2sdCdCUQOjpzZt1JPyYdZdQYLZv7U2pEmtBJcm9AalS5H9
	 ab6/B8AU0Wd2sLDPNrs/pJAGnt0A/NKLUxDsDypIdWDSBP20k02p9v+9MeFPmakKRB
	 xTZHe8KiMkEvaHOZBEoE6VKL/itb4rZJjbKEZY4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E09F80229;
	Wed,  4 Nov 2020 12:30:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1924FF80234; Wed,  4 Nov 2020 12:30:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30061F8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 12:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30061F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vHn4ezPf"
Received: by mail-wr1-x444.google.com with SMTP id 33so10853711wrl.7
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S98hGeY7ZA73e66abMJQ3IOnnZUlVmbNDaPLBNYGOuU=;
 b=vHn4ezPfj8m+7O0997sBqIAe/nGMNROwTmdd/SB7dvjkPFo62QpCkj2BpeolhDinjc
 VpC1IsLadJEbzmAwSaLDTes2fIUjnZ/gEiEBuj91S/YL+2Q4godxcqdfudYiIfS2bWDj
 3xPqxa9XRl300X2UmOmX0mlDfFFVkKQF/yzRqf8+UyPyhbNMk/x3wMtMlUk7e3E678CN
 jdPL6XKTEHKy5FZO1M+W0OP53pRy18BivtVB/0i7PP/5nfoc+io5q7f0XEC4oDJudyyv
 7ykA0CrKO977ZN2L8a7hbHQlankTUHrwvjkCS9HeU0RBxOeZcc/WVfOzulv+Ne3EokuC
 DCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S98hGeY7ZA73e66abMJQ3IOnnZUlVmbNDaPLBNYGOuU=;
 b=GH93vgODanR4NjFkA27zaaxEQq91ymzsDFzCe//XIkc4WQ/+FhB+h4jZQfjDMJrklK
 m3sKJ5WFk9yMkFMZx+s+3+henTz0npq69PnZUoY4lcXHO0sHOlO2Q8R3o/KRat8gpKvg
 Uf98nIf2SudPrhIvmNZ14cmewHdQ/4fHPIAMAY2JYneGdCNisPQKidJK4PMuAVGPXWG/
 MNHWz9UKKi1IWVvsRBY9CGEU8P4OkpaVvNLNw0JLCyoZz7rb5Yma9ybsZQpZ9axbxgeY
 60IuNgJEINT9tcGNgsRsgN+BFgPycp4sqaYjCP89IyavYwjB7DN9QjyaPh+ljiu/idYR
 997g==
X-Gm-Message-State: AOAM531QSuyjQ/qHtqgbYR/VoAMQViE+s8m/SHAt3e1L1d62L3FSTBur
 MZMj3xF/DpdThpYB/1mudX4z2A==
X-Google-Smtp-Source: ABdhPJxZnV5Gc2GvHl6mWJJLQRjXccdVJftbSOnJ86NTkhURNkUDhGEgZXRoGxCIxwjN5+XfSM+qWQ==
X-Received: by 2002:a05:6000:104e:: with SMTP id
 c14mr31356100wrx.329.1604489388190; 
 Wed, 04 Nov 2020 03:29:48 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id c64sm1692813wme.29.2020.11.04.03.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 03:29:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized attribute
Date: Wed,  4 Nov 2020 11:29:41 +0000
Message-Id: <20201104112941.1134-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com
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

running kernel with CONFIG_DEBUG_LOCKS_ALLOC enabled will below warning:

BUG: key ffff502e09807098 has not been registered!
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 5 PID: 129 at kernel/locking/lockdep.c:4623
	lockdep_init_map_waits+0xe8/0x250
Modules linked in:
CPU: 5 PID: 129 Comm: kworker/5:1 Tainted: G
       W         5.10.0-rc1-00277-ged49f224ca3f-dirty #1210
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events deferred_probe_work_func
pstate: 80c00005 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
pc : lockdep_init_map_waits+0xe8/0x250
lr : lockdep_init_map_waits+0xe8/0x250
 [ Trimmed ]

Call trace:
 lockdep_init_map_waits+0xe8/0x250
 __kernfs_create_file+0x78/0x180
 sysfs_add_file_mode_ns+0x94/0x1c8
 internal_create_group+0x110/0x3e0
 sysfs_create_group+0x18/0x28
 devm_device_add_group+0x4c/0xb0
 add_all_attributes+0x438/0x490
 sdw_slave_sysfs_dpn_init+0x128/0x138
 sdw_slave_sysfs_init+0x80/0xa0
 sdw_drv_probe+0x94/0x170
 really_probe+0x118/0x3e0
 driver_probe_device+0x5c/0xc0

 [ Trimmed ]

CPU: 5 PID: 129 Comm: kworker/5:1 Tainted: G
     W         5.10.0-rc1-00277-ged49f224ca3f-dirty #1210
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events deferred_probe_work_func
Call trace:
 dump_backtrace+0x0/0x1c0
 show_stack+0x18/0x68
 dump_stack+0xd8/0x134
 __warn+0xa0/0x158
 report_bug+0xc8/0x178
 bug_handler+0x20/0x78
 brk_handler+0x70/0xc8

[ Trimmed ]

Fix this by initializing dynamically allocated sysfs attribute to keep lockdep happy!

Fixes: bcac59029955 ("soundwire: add Slave sysfs support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/sysfs_slave_dpn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
index 05a721ea9830..c4b6543c09fd 100644
--- a/drivers/soundwire/sysfs_slave_dpn.c
+++ b/drivers/soundwire/sysfs_slave_dpn.c
@@ -37,6 +37,7 @@ static int field##_attribute_alloc(struct device *dev,			\
 		return -ENOMEM;						\
 	dpn_attr->N = N;						\
 	dpn_attr->dir = dir;						\
+	sysfs_attr_init(&dpn_attr->dev_attr.attr);			\
 	dpn_attr->format_string = format_string;			\
 	dpn_attr->dev_attr.attr.name = __stringify(field);		\
 	dpn_attr->dev_attr.attr.mode = 0444;				\
-- 
2.21.0

