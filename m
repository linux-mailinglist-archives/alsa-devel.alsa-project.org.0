Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876DCFC040
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 07:38:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0E18839;
	Thu, 14 Nov 2019 07:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0E18839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573713501;
	bh=6wMzRISlM6XMsqSXmbbffGJLBiPW9ZmVb2TxI3DPjps=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6aCzeXlowe3bbz2f/pNQHxfmLD/MlzkT6ryqG53iMM6fg+9dQHLH8QI3c2mKv/4h
	 e0Q+jpQ3nCs6zycAR7ZA8xp76rdTxKcmUCcaBtCs1rLciZfIKSQCmFs8hHdB5Wue0F
	 KnOKySaviMzlE7eRpuUAYCycXQduJ8vcz5uh25Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BC1F80115;
	Thu, 14 Nov 2019 07:34:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA3FF800CF; Thu, 14 Nov 2019 04:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1597F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 04:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1597F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="O2MSp4ne"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcccc070000>; Wed, 13 Nov 2019 19:37:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 19:37:43 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 19:37:43 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 Nov 2019 03:37:42 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Thu, 14 Nov 2019 09:07:02 +0530
Message-ID: <20191114033704.18171-4-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114033704.18171-1-nmahale@nvidia.com>
References: <20191114033704.18171-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573702663; bh=GFJTuhDHEyTAZF3QHNTG4tgZYvzDWCHGtTtKHGG8hLo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=O2MSp4ne+4LJi2v3o72ZZgN0XyGoaf6eyogs6bOFapPRClWyR+3crsHLy3RGLVcF/
 jNooiX0QqH53jH8rUQzUHJv6zmlhWCul3WDqrZer6p8TXUe+g3m6qLxUT8SmbZAOpN
 S486WVZ+xQFikyomAe4KuKUuw9RTjTY8HhEcmn+1r8T9Ks4TRPZKvTAFR6UTJ/W1Os
 dFqtpipWamEBFD6CARUSLGqtrN5YhnsYxZStUTU0jzBUYNUACKkJi4jV1aQh1k3ELH
 vLbt7IcpJx/FPTxVqdCTO7+YpUzClizpO0C12YS4eHO7k+cKX0y2CBV43QQP7LNXaj
 pwc1FgVltzlTw==
X-Mailman-Approved-At: Thu, 14 Nov 2019 07:34:48 +0100
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 3/5] ALSA: hda - Add DP-MST conn list support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document change notification HDA040-A for the Intel High Definition
Audio 1.0a specification introduces a Device Select verb for Digital
Display Pin Widgets that are multi-stream capable. This verb selects
a Device Entry that is used by subsequent Pin Widget verbs,
including the Get Connection List Entry verb.

This patch queries the current Device Select value, associates it
with the connection list, and updates the connection list management
code to consider dev_id along with nid.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/hda_codec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index a2fb19129219..8f32cab8f4a4 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -88,6 +88,7 @@ struct hda_conn_list {
 	struct list_head list;
 	int len;
 	hda_nid_t nid;
+	int dev_id;
 	hda_nid_t conns[0];
 };
 
@@ -96,8 +97,9 @@ static struct hda_conn_list *
 lookup_conn_list(struct hda_codec *codec, hda_nid_t nid)
 {
 	struct hda_conn_list *p;
+	int dev_id = snd_hda_get_dev_select(codec, nid);
 	list_for_each_entry(p, &codec->conn_list, list) {
-		if (p->nid == nid)
+		if (p->nid == nid && p->dev_id == dev_id)
 			return p;
 	}
 	return NULL;
@@ -113,6 +115,7 @@ static int add_conn_list(struct hda_codec *codec, hda_nid_t nid, int len,
 		return -ENOMEM;
 	p->len = len;
 	p->nid = nid;
+	p->dev_id = snd_hda_get_dev_select(codec, nid);
 	memcpy(p->conns, list, len * sizeof(hda_nid_t));
 	list_add(&p->list, &codec->conn_list);
 	return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
