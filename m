Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9A2463CA9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 18:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6867F238F;
	Tue, 30 Nov 2021 18:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6867F238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638292825;
	bh=vP1gOxpWYPAIQlMTwhoxIT14ZcEJgFWWlGVkqAobYg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAS3iN6nZFS072cmEolOsLb3uzipOAX5v9rmNASE7HPZDyTFOZDYj0aSmATBgF73K
	 JBcA+5Gp/LsjlBywOH3Rf/Fe/96ZDzVOzY3JbyIS4qa/TwnsJFIryKHxzGinjg8n3f
	 qjJ427qf74O6XZe0HW1L/xaYX3/jNn6RCIOkrc+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEAB1F800EE;
	Tue, 30 Nov 2021 18:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF4AEF80290; Tue, 30 Nov 2021 18:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322F9F80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 18:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322F9F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y37uRRP6"
Received: by mail-pf1-x430.google.com with SMTP id r130so21353902pfc.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vP1gOxpWYPAIQlMTwhoxIT14ZcEJgFWWlGVkqAobYg8=;
 b=Y37uRRP6o5MgMyQkqD8PiX/6xflfPptaSOoyAyqy3Lfk2a5P/z7mGFluDx4VVWa7Jh
 BnE+fEbZc12cpwUlbwjg0Au2pJyCvopQscefnR2glrX1+Xietw2AEtyiiQxrjJeUOZJg
 9cjNHfsNmtfIewzx6a89icdLEvynVHHy447Iv3YZ6zSxKKcpQRGgcHrm/hLyqJWZ+JDx
 mi92gUoptO/NICpuQsiy25PIkfOGf23mvVewgyObhm+RZ0hJ1PQfXVH7vmze3+xuktI3
 ricyOMbMarDy8ltTqLqZXKRd9NAT/+LcoyNKYjEqve6DojhMykVJzSjrYNYXcCLOmSP6
 EM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vP1gOxpWYPAIQlMTwhoxIT14ZcEJgFWWlGVkqAobYg8=;
 b=n5ObwasKzDgXblO1ozfZTDDyJE5XFbpq5Q3WXOlRCo2PwweM/Yt1v1fN9LLN75eSSF
 /eoYNSeuCwUw3efT5ZnuGuomwhTPH0UH0HTexkIChB6lr+AZD+uSeuznp19hzJpIyNU1
 1fT2E5pdD8qlwzxV03lGRSOfwIPePqx3Sz/PMzFLhdd/yjgAUpLZBgDcIO/2BryTG8LK
 t2utNTid0nG+UvCQixewG+rlb9cTWaLZK+zFGtGQNK+aklvqUlIpWtL2HxUtR8bXGiKO
 CzDrF1q+K3dMxFk71SWt1lZoGyn+/bCk8x8NqsBhsE2LtiprA7WuoY/ZVCD5hRNp5eEx
 xWgg==
X-Gm-Message-State: AOAM530xqyGQ7bCxUmllvutk0L4dJVt0AXNy3uXuo2K3HhqyIyTWcqGg
 t3XXQD+/x7JMrkD0SBfuD/c=
X-Google-Smtp-Source: ABdhPJy9Yxr+6bmNEhtjihDtbK4VluzB9Hi4XbxmPxyhDIcAapDKFGM9GnicxQgxuAJYtDpfqnG7Ww==
X-Received: by 2002:aa7:9a4e:0:b0:4a2:71f9:21e0 with SMTP id
 x14-20020aa79a4e000000b004a271f921e0mr272066pfj.77.1638292740085; 
 Tue, 30 Nov 2021 09:19:00 -0800 (PST)
Received: from localhost.localdomain ([47.242.44.139])
 by smtp.gmail.com with ESMTPSA id il7sm3446332pjb.54.2021.11.30.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:18:59 -0800 (PST)
From: youling257 <youling257@gmail.com>
To: brent.lu@intel.com
Subject: Re: [PATCH v5 4/6] ASoC: Intel: soc-acpi-byt: shrink tables using
 compatible IDs
Date: Wed,  1 Dec 2021 01:18:41 +0800
Message-Id: <20211130171841.17277-1-youling257@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029171409.611600-5-brent.lu@intel.com>
References: <20211029171409.611600-5-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 rander.wang@intel.com, liam.r.girdwood@linux.intel.com, mac.chiang@intel.com,
 gongjun.song@intel.com, bard.liao@intel.com, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 vamshi.krishna.gopal@intel.com, rander.wang@linux.intel.com,
 yong.zhi@intel.com, ckeepax@opensource.cirrus.com, hdegoede@redhat.com,
 broonie@kernel.org, christophe.jaillet@wanadoo.fr, paul.olaru@oss.nxp.com,
 libin.yang@intel.com, malik_hsu@wistron.corp-partner.google.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 cujomalainey@chromium.org
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

This patch cause Bay trail-CR z3735f tablet rt5640 no sound, bytcr_rt5640 bytcr_rt5640: Error cannot find '' dev.
