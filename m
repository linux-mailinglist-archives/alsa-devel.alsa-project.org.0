Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A963444BAAB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 04:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21200165D;
	Wed, 10 Nov 2021 04:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21200165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636516023;
	bh=TPaQkH3Jt+FnG11Dq8kitaNpiOHGCbdtpq72WKv1/Lk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IWUWTi+W9w72qOamHoJ8VHsCjNw5y9mEghtDvWibbGp45Zb00ptriABp50bwbxZ0d
	 Kp1pMWwInxpx4Qp4vEbCNxSPvpIX5QUTFi6ltyfDZBkjj2LVlzzpiqK5P6m1P9chVv
	 3GZzqih6OS/T/y+2Hq2YQZFRbujduceteTtYavDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD56F804BC;
	Wed, 10 Nov 2021 04:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8781F804B1; Wed, 10 Nov 2021 04:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C976F80054
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 04:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C976F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ghN8MuxF"
Received: by mail-pj1-x1033.google.com with SMTP id iq11so431490pjb.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 19:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=kE7conhGwlDchql6TUuzI3SKW5A/9f27/zONhyNotjE=;
 b=ghN8MuxFashQf2xTxaMzOG3TvvsHlnxCwUP782NhHELGj8f16T9Iyl8DyXVACHdTmu
 rnZnXOaxC+gdu0OJKUeFPuCr3sUNr/YalYD6kfvA/oS/0i8zhsxFaZSKVS/ADAf6AS0w
 NyeGR6Osh6kR7W7C6Ax2Gzc4usIlUd0WRA2/LQAYqx1flZ+hkOO0APZ9y33vdZBzwSVn
 XYxLTstPgFhIpN89dV0Z54nS5sm8vK0qh1Bv2HLtaR7fQcVUXz775ug4pRGFd4/XFRl1
 4YvCdSbb4MrVgiWRDmzBusg1gaV/3Mgpp3gJr9v5ZxD5XHWJOaD+P/NdnfqwZJl2c9iJ
 Kuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kE7conhGwlDchql6TUuzI3SKW5A/9f27/zONhyNotjE=;
 b=BPRlG5OkfOS44ECMTZu+9BlTGCB8gZspZh+z8Pbinp78S5ZD0H53jaMR+s5i08euxe
 lZ8OngorrwLzpOMVWmTrA/ImDr3G+kTXjSPQ/KFfntLgKQyVf1jBX1DE2XdSV7fBeICr
 uSOudfdnzAEiGaELMEU27cosqxsTn9F5KDSd3ZQ9FGw+XUc/0vsZoGLYe6AGGz3FPZKV
 pUGa0tQIDYa8shk6K8YYeLN6Y3ICWeUIf+FQdzsLK+U+b5qEFcUzcvxcGgI+YrrRAoWI
 4tLBMN2C9xEK5WmSutN/9e9SqCHNFwUn4GspuAnom23Pe/YjcHwfQr3Jblduf0GYbAJF
 xo2g==
X-Gm-Message-State: AOAM532x5jS6uaf0cueyJ/XSYhxsVBveXKvm4DyFvsXeQE4Pbhq4dT1c
 3yvrsU6Ghg4nZbx3Af3WYiQ=
X-Google-Smtp-Source: ABdhPJx4trwJ/AUKNPouFhukvbKiawlY+HdLm3vVDl1fqvWkFQsV8nVPVQ7t9wxF4ct4gJ4DHrXAKg==
X-Received: by 2002:a17:90a:b783:: with SMTP id
 m3mr13511973pjr.183.1636515928469; 
 Tue, 09 Nov 2021 19:45:28 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:46a:f117:d5ee:c3e5:104f:c135])
 by smtp.gmail.com with ESMTPSA id q6sm5995293pgn.42.2021.11.09.19.45.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 19:45:27 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2 0/3] ASoC: rt9120: Fix settings and make compatible with
 rt9120s
Date: Wed, 10 Nov 2021 11:45:18 +0800
Message-Id: <1636515921-31694-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series add the below changes
- Fix the wrong ocp level setting.
- Fix clock auto sync issue.
- Make the driver compatible with rt9120s

ChiYuan Huang (3):
  ASoC: rt9120: Update internal ocp level to the correct value
  ASoC: rt9120: Fix clock auto sync issue when fs is the multiple of 48
  ASoC: rt9120: Add the compatibility with rt9120s

 sound/soc/codecs/rt9120.c | 58 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

-- 
2.7.4

