Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34092290AE5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F3B180C;
	Fri, 16 Oct 2020 19:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F3B180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602869914;
	bh=vYA+jR7Q2eva9KYvaf93L2eVPMf0MzV0O+vl8IzyPg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmsMosHcefIMIwrsERzUpfH87g+XHaN3CPtBzphO4ivQ0BZ3ipMmM2xsguoa1g0Jq
	 /54O5/tau393ntODwRAAeRG/CHvKK8zJSJyGfUynf8xkP4fZnTBSpgogosQal9I/pT
	 cAGZtiYajjuB29ZuM44aLFUevx4zV9qybti9W/Oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9492EF8028A;
	Fri, 16 Oct 2020 19:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142EBF8012A; Fri, 16 Oct 2020 19:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E7E0F80217
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E7E0F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ESp69lXr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GHQLpb024369; Fri, 16 Oct 2020 12:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Sbyc3elfe5cGEpv4dZBEhJ14A8BlEZdf/uoEkZ7w/RI=;
 b=ESp69lXrKmH+79kytPzAhF9hFXpbB+tXLUZp/1+hCpV1+S6AH7c0TmLDMf2ZtSeKeC+w
 +l7ZuFR5do+1gbrk17rswImhcIn/M3adk4MpYWMRHQaXKRZfP3SoCip3nLaEYWXSRNwj
 zy4k2hGSDVE23asVe+UVDDDbbuAe2DGNhedaRm/twCcp3ySQPAH1j7fQQAu4ChKK/f//
 Wmor21uD6cEN7l++Klx9mONJqMlF1KBzujvo6VXYaO3XrCaGQMPQezT2Gy+e9N8SuSSK
 0Z6W3UvIO+Gy4K/+pRutME7Gqwo+EZs3o6K+4KRw2lowfZrFaH6M6A3dAqaF04Q3EK22 Yw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac20jk8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 12:35:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 18:35:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 18:35:45 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8AF8D2A1;
 Fri, 16 Oct 2020 17:35:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH v2 1/7] of: base: Add of_count_phandle_with_fixed_args()
Date: Fri, 16 Oct 2020 18:35:35 +0100
Message-ID: <20201016173541.21180-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016173541.21180-1-rf@opensource.cirrus.com>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160130
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Add an equivalent of of_count_phandle_with_args() for fixed argument
sets, to pair with of_parse_phandle_with_fixed_args().

The existing of_count_phandle_with_args() is modified to be a
private function that handles both cases and the public functions
are trivial wrappers round that.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/of/base.c  | 73 +++++++++++++++++++++++++++++++---------------
 include/linux/of.h |  9 ++++++
 2 files changed, 59 insertions(+), 23 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 161a23631472..c5ff2524bf40 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1720,34 +1720,22 @@ int of_parse_phandle_with_fixed_args(const struct device_node *np,
 }
 EXPORT_SYMBOL(of_parse_phandle_with_fixed_args);
 
-/**
- * of_count_phandle_with_args() - Find the number of phandles references in a property
- * @np:		pointer to a device tree node containing a list
- * @list_name:	property name that contains a list
- * @cells_name:	property name that specifies phandles' arguments count
- *
- * Returns the number of phandle + argument tuples within a property. It
- * is a typical pattern to encode a list of phandle and variable
- * arguments into a single property. The number of arguments is encoded
- * by a property in the phandle-target node. For example, a gpios
- * property would contain a list of GPIO specifies consisting of a
- * phandle and 1 or more arguments. The number of arguments are
- * determined by the #gpio-cells property in the node pointed to by the
- * phandle.
- */
-int of_count_phandle_with_args(const struct device_node *np, const char *list_name,
-				const char *cells_name)
+static int __of_count_phandle_with_args(const struct device_node *np,
+					const char *list_name,
+					const char *cells_name,
+					int cells_count)
 {
 	struct of_phandle_iterator it;
 	int rc, cur_index = 0;
 
 	/*
-	 * If cells_name is NULL we assume a cell count of 0. This makes
-	 * counting the phandles trivial as each 32bit word in the list is a
-	 * phandle and no arguments are to consider. So we don't iterate through
-	 * the list but just use the length to determine the phandle count.
+	 * If cells_count < 0 and cells_name is NULL we assume a cell count
+	 * of 0. A zero cell count makes counting the phandles trivial as each
+	 * 32bit word in the list is a phandle and no arguments are to consider.
+	 * So we don't iterate through the list but just use the length to
+	 * determine the phandle count.
 	 */
-	if (!cells_name) {
+	if ((cells_count < 0 && !cells_name) || cells_count == 0) {
 		const __be32 *list;
 		int size;
 
@@ -1758,7 +1746,7 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 		return size / sizeof(*list);
 	}
 
-	rc = of_phandle_iterator_init(&it, np, list_name, cells_name, -1);
+	rc = of_phandle_iterator_init(&it, np, list_name, cells_name, cells_count);
 	if (rc)
 		return rc;
 
@@ -1770,8 +1758,47 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 
 	return cur_index;
 }
+
+/**
+ * of_count_phandle_with_args() - Find the number of phandles references in a property
+ * @np:		pointer to a device tree node containing a list
+ * @list_name:	property name that contains a list
+ * @cells_name:	property name that specifies phandles' arguments count
+ *
+ * Returns the number of phandle + argument tuples within a property. It
+ * is a typical pattern to encode a list of phandle and variable
+ * arguments into a single property. The number of arguments is encoded
+ * by a property in the phandle-target node. For example, a gpios
+ * property would contain a list of GPIO specifies consisting of a
+ * phandle and 1 or more arguments. The number of arguments are
+ * determined by the #gpio-cells property in the node pointed to by the
+ * phandle.
+ */
+int of_count_phandle_with_args(const struct device_node *np, const char *list_name,
+				const char *cells_name)
+{
+	return __of_count_phandle_with_args(np, list_name, cells_name, -1);
+}
 EXPORT_SYMBOL(of_count_phandle_with_args);
 
+/**
+ * of_count_phandle_with_fixed_args() - Find the number of phandles references in a property
+ * @np:		pointer to a device tree node containing a list
+ * @list_name:	property name that contains a list
+ * @cell_count: number of argument cells following the phandle
+ *
+ * Returns the number of phandle + argument tuples within a property. It
+ * is a typical pattern to encode a list of phandle and variable
+ * arguments into a single property.
+ */
+int of_count_phandle_with_fixed_args(const struct device_node *np,
+				     const char *list_name,
+				     int cells_count)
+{
+	return __of_count_phandle_with_args(np, list_name, NULL, cells_count);
+}
+EXPORT_SYMBOL(of_count_phandle_with_fixed_args);
+
 /**
  * __of_add_property - Add a property to a node without lock operations
  */
diff --git a/include/linux/of.h b/include/linux/of.h
index 481ec0467285..4382a8946310 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -377,6 +377,8 @@ extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
 	struct of_phandle_args *out_args);
 extern int of_count_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name);
+extern int of_count_phandle_with_fixed_args(const struct device_node *np,
+	const char *list_name, int cells_count);
 
 /* phandle iterator functions */
 extern int of_phandle_iterator_init(struct of_phandle_iterator *it,
@@ -886,6 +888,13 @@ static inline int of_count_phandle_with_args(struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline int of_count_phandle_with_fixed_args(const struct device_node *np,
+						   const char *list_name,
+						   int cells_count)
+{
+	return -ENOSYS;
+}
+
 static inline int of_phandle_iterator_init(struct of_phandle_iterator *it,
 					   const struct device_node *np,
 					   const char *list_name,
-- 
2.20.1

