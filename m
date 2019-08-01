Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D8A7D86B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 11:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCF416B1;
	Thu,  1 Aug 2019 11:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCF416B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564651393;
	bh=xroawR667n8/ZWlzfFv3kFOtsQrVy7/R5aGgjqHYMgI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mcVxNNDV1XsWp3xS9e/THKgVn9AePKu6mqEPs06Ghsfl4Z6O3iGv95w9iQ8+Ll5ob
	 B3h5t0OmOkk/gXbA3w4M/2V0pBHXI8O3qEyEQATof2+HvqBt2RFXIRbOYlPnRaAsb5
	 ljplXxlcUJQeeRyHd7tC03bFBgdYl/wCg5bnMRVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1803CF80528;
	Thu,  1 Aug 2019 11:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47995F800F3; Thu,  1 Aug 2019 11:19:39 +0200 (CEST)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ED1DF804CF
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 11:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED1DF804CF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 02:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="201228710"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2019 02:09:19 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  1 Aug 2019 17:15:06 +0800
Message-Id: <20190801091506.19733-1-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] topology: add support to parse private data
	for pcm
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

We have private data section in struct snd_soc_tplg_pcm, but alsatplg
doesn't support handling it yet, here add handling in tplg_parse_pcm()
to enable it.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 src/topology/data.c | 3 +++
 src/topology/pcm.c  | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/src/topology/data.c b/src/topology/data.c
index b3f4421f..729ce1f4 100644
--- a/src/topology/data.c
+++ b/src/topology/data.c
@@ -53,6 +53,9 @@ struct snd_soc_tplg_private *get_priv_data(struct tplg_elem *elem)
 	case SND_TPLG_TYPE_BE:
 		priv = &elem->link->priv;
 		break;
+	case SND_TPLG_TYPE_PCM:
+		priv = &elem->pcm->priv;
+		break;
 	default:
 		SNDERR("error: '%s': no support for private data for type %d\n",
 			elem->id, elem->type);
diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index 5f586dc1..c533ee68 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -732,6 +732,14 @@ int tplg_parse_pcm(snd_tplg_t *tplg,
 				return err;
 			continue;
 		}
+
+		/* private data */
+		if (strcmp(id, "data") == 0) {
+			err = tplg_parse_data_refs(n, elem);
+			if (err < 0)
+				return err;
+			continue;
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
