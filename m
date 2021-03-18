Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A534035B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B13EA16D7;
	Thu, 18 Mar 2021 11:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B13EA16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063589;
	bh=cxAscVz+agLs2HVe72q50Jcm1ehLDwk3XflI/3OP7gg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iy02uVCPEWonMRoCEsdG+PDqK1HsEF+g66Wbtku6iGA0ByIrzdgpCFZIqMJtETV9t
	 aGVJP1oNleKmiHDtCxNoH/6xL/I3x/4GN9Xj139yP+hX8KLcLXKIkpSOd1osNzyUOX
	 cC6RHBLhHThkNqPQxck8sbg+EndITI55dZL9EC5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FEB7F80482;
	Thu, 18 Mar 2021 11:30:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4607F8032D; Thu, 18 Mar 2021 11:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 193A4F8023B
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 193A4F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Hne3fn9I"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WYlq/7s5"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C29AE1B58;
 Thu, 18 Mar 2021 06:30:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Mar 2021 06:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f6L1YIn1G7z89
 hWlf3nQMmoJAA+CRalKervkbdlyh18=; b=Hne3fn9ILzOFsdKDEKa2j+1dFjRXp
 bqLUgwgO9O9ywmvnyR4Zc0Dg+F+se5zmbkQzJp8UbmKRUgU1A/ApSFVReSHG3/ao
 iKcMhrEWOIOmG9jKGR1fJDmklBjvZVxthjF3HsiuIFDg4dgS8SGUk1EIXCtnT5L+
 k5Y6G92z79Lj/Gzr9VyuuzfyNqvK1wk1GQ4ZH+dkkkOmXbi5gFDB/4nlsfK9IMj8
 zoxSnJLrfVAN4QWlcqRSdu4dgPBWoT8d6bficA8kmqlCw4gajTs/6GHf4dVLGLcG
 5Cfr12+XyDqxZ1p6mIfkOkWiG0IBS2JiZj7pYQ3UHAe94m3yXxu1FSl3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f6L1YIn1G7z89hWlf3nQMmoJAA+CRalKervkbdlyh18=; b=WYlq/7s5
 ZQDfbkBVjFtBd8luVdpgP/2hEBGpTvav7xSCcj84wfSS49GDwiY0ED7jqqYxtYOW
 eTrah3Oj337Pgz/5D1Firg4t3jsoC2uEdlzflmaRiIjV+pL+VpynhWXU4gvqTucZ
 o78QKtXKn0PKRDcKvL1cq0bRZ1fICHgSx+ktkIFdXendItZ1w/9p+wxM2KvlYjE/
 Qgim3oKhT/WJCRLz5mPY2qVN7AF3kt+VlPM5hAkASdpM1yT1aKYsBSZG+g9T6ZCc
 sMUhL3CpkPG/TI12Qv+oT7StA6mt4tr6UoDscwo5Ids+Lb5QCCVVFwY1izEc6xrf
 fk+X3x9i5mwBAQ==
X-ME-Sender: <xms:witTYAC6ZxaVHUdTK6FPJNA-24YdTbRus927cARpJcUX8hCYOlYXeQ>
 <xme:witTYOYEKypl3bSLYPSWvjsMn8AS0b4NJABRFLquGowQ_1KMWHZgmtcPs4Abrsi9X
 0iXG_8uLVY4dhzV9yM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:witTYAnVimL3YVQ_ioMi6AI6hZeuzMOyNGUhOHcZLCz_3khWWgWQ5g>
 <xmx:witTYLo1AKBqgH15WZEJR_QgoJAbgA_Zc-IlPZqXreQMy1xbeaA2rw>
 <xmx:witTYKA1JeyAluOLrHhBlp1Y4n8p_BB7XuDDrJNni5_Aud7y0lyAqA>
 <xmx:witTYMepo5ZiK9kzAUUzbLBLIS2JmYh7WMd_GraI3MtPES9UheQ1XA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 449B61080068;
 Thu, 18 Mar 2021 06:30:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 6/6] ctl: drop deprecated API to compare a pair of
 control element IDs
Date: Thu, 18 Mar 2021 19:30:13 +0900
Message-Id: <20210318103013.265264-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

A commit 2cfe6addaef6 ("control: add snd_ctl_elem_id_compare()
function") adds 'snd_ctl_elem_id_compare()' API, however the
implementation has several bugs.

At first, the name is not inappropriate since it implements one of
comparison algorithms. The name itself implies the algorithm is single
and unique for control element ID.

Secondary, it subtracts a pair of values in fields of 'unsigned int' type
in storage size of the type. It brings integer overflow.

Tertiary, it compares subdevice field in the same structure.

Fortunately, the issued API is not public in any release. An alternative
API, 'snd_ctl_elem_id_compare_by_name_arithmetic()', is already added with
enough tests. This commit drops the issued API.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/control.h     |  1 -
 src/control/control.c | 35 -----------------------------------
 2 files changed, 36 deletions(-)

diff --git a/include/control.h b/include/control.h
index 1b2cc0c6..3975f4b7 100644
--- a/include/control.h
+++ b/include/control.h
@@ -428,7 +428,6 @@ int snd_ctl_elem_id_equal_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare_by_tuple_arithmetic(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
-int snd_ctl_elem_id_compare(snd_ctl_elem_id_t *id1, const snd_ctl_elem_id_t *id2);
 unsigned int snd_ctl_elem_id_get_numid(const snd_ctl_elem_id_t *obj);
 snd_ctl_elem_iface_t snd_ctl_elem_id_get_interface(const snd_ctl_elem_id_t *obj);
 unsigned int snd_ctl_elem_id_get_device(const snd_ctl_elem_id_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index fbc6aeb7..1d83cb6a 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -1936,41 +1936,6 @@ int snd_ctl_elem_id_compare_by_tuple_arithmetic(snd_ctl_elem_id_t *l, snd_ctl_el
 	return compare_unsigned_integer(l->index, r->index);
 }
 
-/**
- * \brief compare one #snd_ctl_elem_id_t to another
- * \param id1 pointer to first id
- * \param id2 pointer to second id
- * \retval zero when values are identical, other value on a difference (like strcmp)
- *
- * This comparison ignores the numid part. The numid comparison can be easily
- * implemented using snd_ctl_elem_id_get_numid() calls.
- *
- * The identifier fields are compared in this order: interface, device,
- * subdevice, name, index.
- *
- * The return value can be used for sorting like qsort(). It gives persistent
- * results.
- */
-int snd_ctl_elem_id_compare(snd_ctl_elem_id_t *id1, const snd_ctl_elem_id_t *id2)
-{
-	int d;
-
-	assert(id1 && id2);
-	d = id1->iface - id2->iface;
-	if (d != 0)
-		return d;
-	d = id1->device - id2->device;
-	if (d != 0)
-		return d;
-	d = id2->subdevice - id2->subdevice;
-	if (d != 0)
-		return d;
-	d = strcmp((const char *)id1->name, (const char *)id2->name);
-	if (d != 0)
-		return d;
-	return id1->index - id2->index;
-}
-
 /**
  * \brief Get numeric identifier from a CTL element identifier
  * \param obj CTL element identifier
-- 
2.27.0

