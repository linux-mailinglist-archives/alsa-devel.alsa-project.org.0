Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B20524B69
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9498B1AAE;
	Thu, 12 May 2022 13:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9498B1AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354397;
	bh=NH8yZoAXdtOReiq0YovMMdMQDe8qqy2jbXkwmV+zIM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=el2BLYQwCDihgVtb9N/VFjgdGOOQmxdQWahkOrKdZnIuOUAN47KgMVK+Ez6WCDOqO
	 bnApbEBdRU1ZV/gUwk0LPAA/bMzwCvmLkgrJjmlEKFDBSw3p/86c1ahOLDCpsuobTB
	 oL+B7Wuj7Zw55pktRI+OXQLxT3OUxkG9A3Ubx4SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 088F6F80516;
	Thu, 12 May 2022 13:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EECC8F80510; Thu, 12 May 2022 13:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8395F80154
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8395F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="G2g3f7m6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fuM6+MD9"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 02F105C01D5;
 Thu, 12 May 2022 07:18:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 12 May 2022 07:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1652354285; x=
 1652440685; bh=nirK3xVc/Xpd3RXmWv7GnNr+Cb6v4Tn8f6hpEo6+q/Y=; b=G
 2g3f7m6h50JCk4Ab9+xqxjNhCOMHa0FNfCrlSSkK/TW5E/l81EtOk+udoqI57HMp
 cBnRCg9XbHW2ncItQBKyiaEwz2Z7nGc6PZyyjzCyFJNr2952rRmnFgFePSs9rW03
 geDiXpITyJNXbZPRzX3dDBo8e4uF3KXGIA9pzbfUe1oL6PLHcvpYZvzn1V9tOBFT
 LmdBLNBjT2GTOflzJSdbWzw5UhZbNvHwbpcpv3q7Jcg9I4tlEUqtWDpwd8k3r4NE
 2iKx/KlY6haj0Wl1AhvM1HCYckgN4PsUriaAOYio7XQCuQjhlIt/uANGAXzXO0hC
 00EEyjLQJ+ctwxEzspDNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652354285; x=1652440685; bh=nirK3xVc/Xpd3RXmWv7GnNr+Cb6v4Tn8f6h
 pEo6+q/Y=; b=fuM6+MD9slT261H3zcvBPXydL6GwbbuAdJzXNKjQNYEdT2CpvDo
 XlwKMSzH3e6DOXbZbCVV1Wyn9q5H0djaG3TZMtHb/oonex24IDttiKizfLPR7Ca6
 AJEYgxL4CdXWc5GZFFW8ONKRwaJw64Xm1cklZTnP25tSVMPfj3z+GSax4jE/KqIn
 9dlFkW9D4Kvrb1rCO+C8X0mdYJX7lZnWYsvpkWXkAghK2mOEXfEQ0OsiOdBdgKnX
 DSFgY74Rc1Jq3gbyd/jeF+rGutRVnlt7Nevtwde2Wd49U/WD64VgRZ0QH93bycHd
 xi/bvS+YXqC2iX2vGQjcsMHtLZ0sTx7T/3g==
X-ME-Sender: <xms:7ex8Yh4nvq20Ky15DhRl-G-DFCtmcUAnLUYQLTuuE_Cu9heMTZnwwQ>
 <xme:7ex8Yu63uSx-wigsUixvGR9aZZrQiFt2BxRWA5z1x_Ta-PQ67vlEapLr2vipt7lsn
 O1pmTrVFxOUCO7PH_g>
X-ME-Received: <xmr:7ex8Yod8G9FftIfb019T5LU0UBwmx37VKQ4wq_IHItRxzAx4JX3HaEjByGTatVD595esY9fzGFN9cHj0luPIcsFMUyG8aesZw52D3fVh6MsNtunoZzI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeei
 gfevueetffeivdffkedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:7ex8YqK77N3XImnBrYE9vQH8OVWjyzOqBETarLPGOfrv-PY9YhTb4g>
 <xmx:7ex8YlI0-98e4G2sIn3N2EHTZOeQnUNY07BW-HucWdTcNkTvBm6wvA>
 <xmx:7ex8YjyPdec7FjytP5RE6z7wZCf8TwqMVFkxv9_g509aLn7TpzZTMQ>
 <xmx:7ex8Yl0gcrcT9EGW9IOYf_bVRjqpuVsIDzPI_B8duwEE-8PU2jpuGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 07:18:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH 2/3] firewire: use struct_size over open coded arithmetic
Date: Thu, 12 May 2022 20:17:55 +0900
Message-Id: <20220512111756.103008-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
References: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 "Minghao Chi \(CGEL ZTE\)" <chi.minghao@zte.com.cn>
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

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

Replace zero-length array with flexible-array member and make use
of the struct_size() helper in kmalloc(). For example:

struct fw_request {
    ...
    u32 data[];
}

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index e12a0a4c33f7..49657a793e80 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -778,7 +778,7 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	}
 
-	request = kmalloc(sizeof(*request) + length, GFP_ATOMIC);
+	request = kmalloc(struct_size(request, data, length), GFP_ATOMIC);
 	if (request == NULL)
 		return NULL;
 
-- 
2.34.1

