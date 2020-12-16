Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074C2DBF58
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 12:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04E3A177C;
	Wed, 16 Dec 2020 12:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04E3A177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608118033;
	bh=rrWuxQ7LMS8pbpYB+pIL0ZGVyjv0yV6SZHW340oBqBs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FlLL9IT2ePLPUiZdfUg8AF0W86GzzD0eVYbB6H4nL1PuBazyzP5QCoGl1Bk+Ibldn
	 9gOmw1FsYx6Z6kIldvZxZsURsFWNWGtfMeu9IGU0+in5tZP2ZmNj8rJKmg2FdBW+P2
	 YGQjmEBNRKZZ5slERx2YN6p7XI21tZxXrhKIBY54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6965FF80240;
	Wed, 16 Dec 2020 12:25:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF38BF801F7; Wed, 16 Dec 2020 12:25:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1951F8011B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 12:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1951F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BWPlQ8k/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BGBMmWJ005254; Wed, 16 Dec 2020 05:25:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Z/vY/iQ2I+iiJtMr3mHJg0NgckGDdZkXzcZBFOYHIpQ=;
 b=BWPlQ8k/efhEWeFJfSgyZmKAMWt4+aKSms9lYhOuxzeUS7B6qt4rYeSnvB/54yK9f9e5
 AlJFgi6n7bIbGl6LZGFZ4Ye36OIiSbmvVUwa6QDYvoQ5Cj+F8EZ1eeO/KhsOc57iEnQw
 yBTAhK7A5S2PNRBOLpR9aBtT1jPy6mjq2+nvClG+eMpCZkqsabCmTDgjgP+60H9lVhfu
 kZVl3/iiQCG1pFCdW3nn0zbT10GDV8uIYQpqJeZ6JGdW9MYcu7WN3ebVVRW32sP0nipT
 TJ5LZ91zQ58iJGo9s6RDyKCBM3gqUDbC3vvWLJxO8DcRYFLA4cJ8A5tWQpbfm2KPkeVs iQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35cv56n9b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Dec 2020 05:25:23 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 16 Dec
 2020 11:25:21 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 16 Dec 2020 11:25:21 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.236])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E96E22AB;
 Wed, 16 Dec 2020 11:25:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Improve handling of raw byte streams
Date: Wed, 16 Dec 2020 11:25:12 +0000
Message-ID: <20201216112512.26503-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=644 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160073
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

As the register map is 16-bit or 32-bit big-endian, the 24-bit
DSP words appear padded and with the bytes swapped. When reading a
raw stream of bytes, the pad bytes must be removed and the data bytes
swapped back to their original order.

The previous implementation of this assumed that the be32_to_cpu() in
wm_adsp_read_data_block() would swap back to little-endian. But this is
obviously only true on a little-endian CPU. It also made two walks
through the data, once to endian-swap and again to strip the pad bytes.

This patch re-works the code so that the endian-swap and unpad are done
together in a single walk, and it is not dependent on the endianness of
the CPU. The data_word_size argument to wm_adsp_remove_padding() has been
dropped because currently this is always 3.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 55 +++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index bcf18bf15a02..7c52ada10af3 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -3662,12 +3662,12 @@ int wm_adsp_compr_get_caps(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_get_caps);
 
-static int wm_adsp_read_data_block(struct wm_adsp *dsp, int mem_type,
-				   unsigned int mem_addr,
-				   unsigned int num_words, u32 *data)
+static int wm_adsp_read_raw_data_block(struct wm_adsp *dsp, int mem_type,
+				       unsigned int mem_addr,
+				       unsigned int num_words, __be32 *data)
 {
 	struct wm_adsp_region const *mem = wm_adsp_find_region(dsp, mem_type);
-	unsigned int i, reg;
+	unsigned int reg;
 	int ret;
 
 	if (!mem)
@@ -3680,16 +3680,22 @@ static int wm_adsp_read_data_block(struct wm_adsp *dsp, int mem_type,
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < num_words; ++i)
-		data[i] = be32_to_cpu(data[i]) & 0x00ffffffu;
-
 	return 0;
 }
 
 static inline int wm_adsp_read_data_word(struct wm_adsp *dsp, int mem_type,
 					 unsigned int mem_addr, u32 *data)
 {
-	return wm_adsp_read_data_block(dsp, mem_type, mem_addr, 1, data);
+	__be32 raw;
+	int ret;
+
+	ret = wm_adsp_read_raw_data_block(dsp, mem_type, mem_addr, 1, &raw);
+	if (ret)
+		return ret;
+
+	*data = be32_to_cpu(raw) & 0x00ffffffu;
+
+	return 0;
 }
 
 static int wm_adsp_write_data_word(struct wm_adsp *dsp, int mem_type,
@@ -3722,18 +3728,22 @@ static inline int wm_adsp_buffer_write(struct wm_adsp_compr_buf *buf,
 				       buf->host_buf_ptr + field_offset, data);
 }
 
-static void wm_adsp_remove_padding(u32 *buf, int nwords, int data_word_size)
+static void wm_adsp_remove_padding(u32 *buf, int nwords)
 {
-	u8 *pack_in = (u8 *)buf;
+	const __be32 *pack_in = (__be32 *)buf;
 	u8 *pack_out = (u8 *)buf;
-	int i, j;
+	int i;
 
-	/* Remove the padding bytes from the data read from the DSP */
+	/*
+	 * DSP words from the register map have pad bytes and the data bytes
+	 * are in swapped order. This swaps back to the original little-endian
+	 * order and strips the pad bytes.
+	 */
 	for (i = 0; i < nwords; i++) {
-		for (j = 0; j < data_word_size; j++)
-			*pack_out++ = *pack_in++;
-
-		pack_in += sizeof(*buf) - data_word_size;
+		u32 word = be32_to_cpu(*pack_in++);
+		*pack_out++ = (u8)word;
+		*pack_out++ = (u8)(word >> 8);
+		*pack_out++ = (u8)(word >> 16);
 	}
 }
 
@@ -3917,12 +3927,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 		return -EINVAL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(coeff_v1.name); i++)
-		coeff_v1.name[i] = be32_to_cpu(coeff_v1.name[i]);
-
-	wm_adsp_remove_padding((u32 *)&coeff_v1.name,
-			       ARRAY_SIZE(coeff_v1.name),
-			       WM_ADSP_DATA_WORD_SIZE);
+	wm_adsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
 
 	buf->name = kasprintf(GFP_KERNEL, "%s-dsp-%s", ctl->dsp->part,
 			      (char *)&coeff_v1.name);
@@ -4261,12 +4266,12 @@ static int wm_adsp_buffer_capture_block(struct wm_adsp_compr *compr, int target)
 		return 0;
 
 	/* Read data from DSP */
-	ret = wm_adsp_read_data_block(buf->dsp, mem_type, adsp_addr,
-				      nwords, compr->raw_buf);
+	ret = wm_adsp_read_raw_data_block(buf->dsp, mem_type, adsp_addr,
+					  nwords, compr->raw_buf);
 	if (ret < 0)
 		return ret;
 
-	wm_adsp_remove_padding(compr->raw_buf, nwords, WM_ADSP_DATA_WORD_SIZE);
+	wm_adsp_remove_padding(compr->raw_buf, nwords);
 
 	/* update read index to account for words read */
 	buf->read_index += nwords;
-- 
2.20.1

