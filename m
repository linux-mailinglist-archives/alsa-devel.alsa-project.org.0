Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF4624A50
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81369168C;
	Thu, 10 Nov 2022 20:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81369168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107289;
	bh=N4/xfqIv1UX0Rnf4ct7QV9VuAXDVlav3IAAOiUFgb44=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lVpsXWKYTMtkQoQ9Pr149nE3rbHN8TcLpynJcp5kYt0XGgzC5nxnbVransy+Gee7f
	 qlAFehtukRgde045YQ5mdz2sulREMdmfvrEFwhlE5tVZk7pX0972cX9BFU0kbtt9CU
	 W+wmvmr/JS/U9vNIIQYWibyYKJMjimfyvWKlqX+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A166F8055B;
	Thu, 10 Nov 2022 20:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41341F80162; Thu, 10 Nov 2022 15:24:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE86DF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 15:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE86DF80162
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4N7PGd0cTdz4f3w0w
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 22:24:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
 by APP4 (Coremail) with SMTP id gCh0CgD3GtiKCW1jxQ4yAQ--.5594S4;
 Thu, 10 Nov 2022 22:24:12 +0800 (CST)
From: Ye Bin <yebin@huaweicloud.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: fix potential memleak in 'add_widget_node'
Date: Thu, 10 Nov 2022 22:45:39 +0800
Message-Id: <20221110144539.2989354-1-yebin@huaweicloud.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3GtiKCW1jxQ4yAQ--.5594S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKFy5Kw18trW7Kr43XFy7KFg_yoWfArg_GF
 W8X3Z8uw1fGrnrK342yws5ZF4qgw43Aw18CrZayFnrAw47GrZ5trsrW3s0yr1UuFWSgFWU
 uryqq34DtFyIkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbr8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WF
 yUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
 CTnIWIevJa73UjIFyTuYvjxUOyCJDUUUU
X-CM-SenderInfo: p1hex046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Nov 2022 20:06:20 +0100
Cc: linux-kernel@vger.kernel.org, yebin10@huawei.com
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

From: Ye Bin <yebin10@huawei.com>

As 'kobject_add' may allocated memory for 'kobject->name' when return error.
And in this function, if call 'kobject_add' failed didn't free kobject.
So call 'kobject_put' to recycling resources.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 sound/hda/hdac_sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index e47de49a32e3..62a9615dcf52 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -346,8 +346,10 @@ static int add_widget_node(struct kobject *parent, hda_nid_t nid,
 		return -ENOMEM;
 	kobject_init(kobj, &widget_ktype);
 	err = kobject_add(kobj, parent, "%02x", nid);
-	if (err < 0)
+	if (err < 0) {
+		kobject_put(kobj);
 		return err;
+	}
 	err = sysfs_create_group(kobj, group);
 	if (err < 0) {
 		kobject_put(kobj);
-- 
2.31.1

