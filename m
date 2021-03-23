Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4D345FBB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 14:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56974167E;
	Tue, 23 Mar 2021 14:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56974167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616506471;
	bh=p//1cpez3tLPJ6ssNGaVsvoviXtImsewSX5gooq9DR8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rBwzSID3GKbim/IwJHcL8bdwKQ6Sln3asNnDDzvrezsRNsFatkh8W7thxKv9rYyDw
	 9piJMCARl/w7xFsEB8i3EJOpOyvFV/9opHhe6Or9r5QcKEAmbCd31vd23TRVbXnbt1
	 vtjYuMFrRsq+Rkxvvu3DBX2ufpm7jInCGq7+L0PQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19811F8026D;
	Tue, 23 Mar 2021 14:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0487F8025F; Tue, 23 Mar 2021 09:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4E14F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 09:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4E14F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="ckSKexqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8X1qg
 gjYrOr60RWTjePpjNY4Tvz0un9W9c9kxBNZccc=; b=ckSKexquUmMdAbMwdw1pK
 Vu4dQ/H88GnRk1kOkKZJfLEFhHN4l7jfpYuIDrjsq4IGN1ZkpT8pe+XvSv5XXQR5
 kB9/XIuAhHKVQVvHkUdV6kWB89Y534sK5tU0BNxKckL9QByjqGSfWOXkz8NR7zlT
 +jD+ZRhapu+gnU7sZqVMKw=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowADHDAEDrVlgKAJaGA--.51S2;
 Tue, 23 Mar 2021 16:55:48 +0800 (CST)
From: caizhichao <tomstomsczc@163.com>
To: geoff@infradead.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound:ppc: fix spelling typo of values
Date: Tue, 23 Mar 2021 16:55:43 +0800
Message-Id: <20210323085543.741-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADHDAEDrVlgKAJaGA--.51S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DZw4rAF4kuFW5GF45Wrg_yoWxCwbE9a
 ykArW8WF95XFsrCr1YyF1rGr4Yqas8Cr929r47KF1DGw4Yvrs5G3yrAry7Jr92gF1vvry5
 WF9YgrnxKr92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RBTUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/xtbBdRReilaD+k4Q8wAAs3
X-Mailman-Approved-At: Tue, 23 Mar 2021 14:32:46 +0100
Cc: alsa-devel@alsa-project.org, caizhichao <caizhichao@yulong.com>,
 mpe@ellerman.id.au, linux-kernel@vger.kernel.org, paulus@samba.org,
 benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org
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

From: caizhichao <caizhichao@yulong.com>

vaules -> values

Signed-off-by: caizhichao <caizhichao@yulong.com>
---
 sound/ppc/snd_ps3_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/snd_ps3_reg.h b/sound/ppc/snd_ps3_reg.h
index 566a318..e2212b7 100644
--- a/sound/ppc/snd_ps3_reg.h
+++ b/sound/ppc/snd_ps3_reg.h
@@ -308,7 +308,7 @@
 each interrupt in this register.
 Writing 1b to a field containing 1b clears field and de-asserts interrupt.
 Writing 0b to a field has no effect.
-Field vaules are the following:
+Field values are the following:
 0 - Interrupt hasn't occurred.
 1 - Interrupt has occurred.
 
-- 
1.9.1


