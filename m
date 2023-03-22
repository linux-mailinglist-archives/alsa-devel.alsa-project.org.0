Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DB6C55EE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:02:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D496EB9;
	Wed, 22 Mar 2023 21:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D496EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515328;
	bh=YpKGVIZwXXwpPXYfMjguBK41oZD5x+E7M/c8749YMQc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r3pIxsdoXd3miCbnSLm+tkT2uBakX/WE1i+tG6Km8vVEzjLPFxjr+ru6et5vlVDfz
	 ZbiRI8mqqxHfG862ltqdpoz8oJhTbj7nxPka7SLcQ8PZCN9yEFVhFNCxHcwbfX7HTT
	 2KmTo4hKK6h7D40TeQuy45KDv/GF00+QfV6pUi6k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7C8F80533;
	Wed, 22 Mar 2023 20:59:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C781F8053B; Wed, 22 Mar 2023 20:59:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C52FF80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C52FF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h6BeHHnW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7BCCBB81DE6;
	Wed, 22 Mar 2023 19:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FB9C4339C;
	Wed, 22 Mar 2023 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515137;
	bh=YpKGVIZwXXwpPXYfMjguBK41oZD5x+E7M/c8749YMQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6BeHHnWUdAhr6mRv9EELkUJZJLjdqWDiiNeUhO3xJ8BkzwEw906U+Wv4XCCjrlpG
	 yiAeCs8zVVKzNEKnzYz47pqwdFx7tXuJha2Om65e02LtPOPD6RCEfkrwHPuyh5rHg4
	 B5KRSeNwvgN0i5nk7lIWGb9adJxBlqD46Ogb6GNgF8GQLO0pDkWehkac0h5lOPA4gd
	 mmnNWDltGuMBLSdGG67DdZO/P5G3x5/GZzJsLi99PBIDN0MUlXqB7cy7YEUa54dFer
	 Gxi17icmACWcojAplDXhDVGBQdQgrYjAf92mSDQFtQeE3kd9qGBZlqbrC88d5UT1CI
	 yhKWgYMd56FWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 30/45] ALSA: asihpi: check pao in
 control_message()
Date: Wed, 22 Mar 2023 15:56:24 -0400
Message-Id: <20230322195639.1995821-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WK5FE66KTVC4AH7ODO5D6EIGBOJX32ME
X-Message-ID-Hash: WK5FE66KTVC4AH7ODO5D6EIGBOJX32ME
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 tiwai@suse.com, dengshaomin@cdjrlc.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WK5FE66KTVC4AH7ODO5D6EIGBOJX32ME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 9026c0bf233db53b86f74f4c620715e94eb32a09 ]

control_message() might be called with pao = NULL.
Here indicates control_message() as sample.

(B)	static void control_message(struct hpi_adapter_obj *pao, ...)
	{                                                   ^^^
		struct hpi_hw_obj *phw = pao->priv;
		...                      ^^^
	}

(A)	void _HPI_6205(struct hpi_adapter_obj *pao, ...)
	{                                      ^^^
		...
		case HPI_OBJ_CONTROL:
(B)			control_message(pao, phm, phr);
			break;          ^^^
		...
	}

	void HPI_6205(...)
	{
		...
(A)		_HPI_6205(NULL, phm, phr);
		...       ^^^^
	}

Therefore, We will get too many warning via cppcheck, like below

	sound/pci/asihpi/hpi6205.c:238:27: warning: Possible null pointer dereference: pao [nullPointer]
		 struct hpi_hw_obj *phw = pao->priv;
		                          ^
	sound/pci/asihpi/hpi6205.c:433:13: note: Calling function '_HPI_6205', 1st argument 'NULL' value is 0
		  _HPI_6205(NULL, phm, phr);
		            ^
	sound/pci/asihpi/hpi6205.c:401:20: note: Calling function 'control_message', 1st argument 'pao' value is 0
	   control_message(pao, phm, phr);
	                   ^
Set phr->error like many functions doing, and don't call _HPI_6205()
with NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ttypeaqz.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/asihpi/hpi6205.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpi6205.c b/sound/pci/asihpi/hpi6205.c
index 27e11b5f70b97..c7d7eff86727f 100644
--- a/sound/pci/asihpi/hpi6205.c
+++ b/sound/pci/asihpi/hpi6205.c
@@ -430,7 +430,7 @@ void HPI_6205(struct hpi_message *phm, struct hpi_response *phr)
 		pao = hpi_find_adapter(phm->adapter_index);
 	} else {
 		/* subsys messages don't address an adapter */
-		_HPI_6205(NULL, phm, phr);
+		phr->error = HPI_ERROR_INVALID_OBJ_INDEX;
 		return;
 	}
 
-- 
2.39.2

