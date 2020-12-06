Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B94742D04C2
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 13:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB7F1785;
	Sun,  6 Dec 2020 13:25:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB7F1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607257596;
	bh=+Sr9XWpAEFRksgIEU8wv90L2EuL5SB8hUQ1galDKQiE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKqKpjbDKPGB5w8ktayVBbT3lOAN4dif4w92FXzruunS/faj0wJMUZHggH1Y8Ya9U
	 IzBDNzSPxkavGCp1P0r4ZfzT/fS+3602dDdS8mLHMxYeQzpsgpqBQP7ptTTLJH8Jqp
	 kh4pKJfRjtU31GY4uDAbomsobBK+Cqdrg3/eX58k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D49E0F8015F;
	Sun,  6 Dec 2020 13:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D1C7F80264; Sun,  6 Dec 2020 13:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DCC2F800B4
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 13:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DCC2F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="iNKlO0h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607257486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JMSrIgmqJ89dqVJVjODMnKS9x8gxqfgWyafSpn5SEc=;
 b=iNKlO0h3nxf82hQwG53tM84tG3KV6DXrT25xlq77jWV8teHNl9g6lTxRfn3WnNH2Nya4+d
 i2UWr+J3e8PuGzJu4ShMSIsQXQm4VjGwYiOfPpmnSDj7CNoehVRXBNqc2OBZj02pqb1DPX
 qFEt6CQJEEJj7tx1tp4teJUDegZhwbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309--15QYQy-P2qfVo4Zs5O8og-1; Sun, 06 Dec 2020 07:24:44 -0500
X-MC-Unique: -15QYQy-P2qfVo4Zs5O8og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6331C107ACE3;
 Sun,  6 Dec 2020 12:24:43 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074285D6A8;
 Sun,  6 Dec 2020 12:24:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: Intel: cht_bsw_nau8824: Change SSP2-Codec DAI id to
 0
Date: Sun,  6 Dec 2020 13:24:36 +0100
Message-Id: <20201206122436.13553-3-hdegoede@redhat.com>
In-Reply-To: <20201206122436.13553-1-hdegoede@redhat.com>
References: <20201206122436.13553-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The snd-soc-sst-acpi driver does not care about the id specified for
the SSP2-Codec DAI, but it does matter for the snd-sof-acpi driver;
and when it is not 0 then the snd-sof-acpi driver does not work.

Set the SSP2-Codec DAI id to 0, fixing the snd-sof-acpi driver not
working on devices using the cht_bsw_nau8824 machine-driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_nau8824.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index ac78173d01ec..fd5e25ca05f7 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -210,7 +210,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	{
 		/* SSP2 - Codec */
 		.name = "SSP2-Codec",
-		.id = 1,
+		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_IB_NF
 			| SND_SOC_DAIFMT_CBS_CFS,
-- 
2.28.0

