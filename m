Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099DD212D3B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A845416CA;
	Thu,  2 Jul 2020 21:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A845416CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718931;
	bh=etao94w9Ko5LRFAODSAI4/6bB/k5vjkMh1k6rI3LLWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9z0lXizNhYlQR6Ly/FOFUl0dYasqOiWuMuSrfBtNzC+wkH+TNHaIwOZyjAJZ88fS
	 Uj389H3E8ptsrFpmU9OwkqfrA9gYNcEOBg6Lm2ocO889KEbnnsbaA1tDj5eQ//u7GY
	 jMICw8zjt5EzmgHFszEe9IE0X2zEm+hU3XbcuxDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B59E7F802DD;
	Thu,  2 Jul 2020 21:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3BE2F802EB; Thu,  2 Jul 2020 21:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CEFEF8027B
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CEFEF8027B
IronPort-SDR: eNYDVotT3Qhz6hEf6nlGXzaTfvViZOUPKp4Va8yzER66E1Kb/mFHmgBXUTTQ6Qv4gsbJxi1cHa
 3KgHOGqZJxGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549344"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549344"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:20 -0700
IronPort-SDR: AIN3V2m548pDekZVYgsFZujHINjlyghoHmn4GxglO/OQ1ubNEVpERUeUlbyIGO/DgJGGmgf5cx
 Pq9uT+/GbAjQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116364"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 04/23] ALSA: pci/asihpi: fix kernel-doc
Date: Thu,  2 Jul 2020 14:35:45 -0500
Message-Id: <20200702193604.169059-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. The code certainly predates .rst syntax, adjust as
needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/asihpi/hpicmn.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/pci/asihpi/hpicmn.c b/sound/pci/asihpi/hpicmn.c
index 968510bc2552..7d1abaedb46a 100644
--- a/sound/pci/asihpi/hpicmn.c
+++ b/sound/pci/asihpi/hpicmn.c
@@ -28,10 +28,12 @@ struct hpi_adapters_list {
 static struct hpi_adapters_list adapters;
 
 /**
-* Given an HPI Message that was sent out and a response that was received,
-* validate that the response has the correct fields filled in,
-* i.e ObjectType, Function etc
-**/
+ * hpi_validate_response - Given an HPI Message that was sent out and
+ * a response that was received, validate that the response has the
+ * correct fields filled in, i.e ObjectType, Function etc
+ * @phm: message
+ * @phr: response
+ */
 u16 hpi_validate_response(struct hpi_message *phm, struct hpi_response *phr)
 {
 	if (phr->type != HPI_TYPE_RESPONSE) {
@@ -106,10 +108,11 @@ void hpi_delete_adapter(struct hpi_adapter_obj *pao)
 }
 
 /**
-* FindAdapter returns a pointer to the struct hpi_adapter_obj with
-* index wAdapterIndex in an HPI_ADAPTERS_LIST structure.
-*
-*/
+ * hpi_find_adapter - FindAdapter returns a pointer to the struct
+ * hpi_adapter_obj with index wAdapterIndex in an HPI_ADAPTERS_LIST
+ * structure.
+ * @adapter_index: value in [0, HPI_MAX_ADAPTERS[
+ */
 struct hpi_adapter_obj *hpi_find_adapter(u16 adapter_index)
 {
 	struct hpi_adapter_obj *pao = NULL;
@@ -137,10 +140,9 @@ struct hpi_adapter_obj *hpi_find_adapter(u16 adapter_index)
 }
 
 /**
-*
-* wipe an HPI_ADAPTERS_LIST structure.
-*
-**/
+ * wipe_adapter_list - wipe an HPI_ADAPTERS_LIST structure.
+ *
+ */
 static void wipe_adapter_list(void)
 {
 	memset(&adapters, 0, sizeof(adapters));
-- 
2.25.1

