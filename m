Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C410541DD10
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7213C16CF;
	Thu, 30 Sep 2021 17:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7213C16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014818;
	bh=XdD4z8tJzQeXmWMRITRvTyCwu8N9yjjNeHgeazkXRqY=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tDl8hwS6MsyUk81sNflvgHNRrpLIDKDV94ezMFs8oqIdve1VpllbCLATECkVjiyQg
	 TtgIPO4yca3P2BYoLNYedBakTnMgODRDJKAiUu2Wjr5oyBKSCVr/pYdCtgwFAV4Hxi
	 ZgSGm0aa4mnS3ZboUwUxPdSsW0XTBN5IqC9eLukg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C27BF804EB;
	Thu, 30 Sep 2021 17:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C36EFF80227; Wed, 29 Sep 2021 23:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A26F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 23:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A26F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="Itr0+U1W"
Received: from [192.168.43.127] (78-80-97-115.customers.tmcz.cz [78.80.97.115])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id BFB3623B26;
 Wed, 29 Sep 2021 23:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1632950386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=XdD4z8tJzQeXmWMRITRvTyCwu8N9yjjNeHgeazkXRqY=;
 b=Itr0+U1WJl97CkalbLnh9Feq2GYAgCM5MQ3nDBEPtOWFyJS0ypZ/w+jOl8ajH8oR6zmSwZ
 6o8yVIv2Q4LKam65BRWMGPQXl8oS672Dv7KXiEz7xiy/y6b+IItuB1Sw9hvl24pN8Qzl8n
 YQhfyLSJKQ+ZNdHeGRqBvQNt6PtUzDY=
Date: Wed, 29 Sep 2021 23:18:21 +0200
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ASoC: dt-bindings: rt5682s: fix the device-tree schema
 errors
To: derek.fang@realtek.com
Message-Id: <LIS70R.CEFK42MUM5NG1@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, jack.yu@realtek.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, shumingf@realtek.com, flove@realtek.com
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

Our CI seems to be happy again. Thanks

Reviewed-by: David Heidelberg <david@ixit.cz>
Best regards
David Heidelberg


