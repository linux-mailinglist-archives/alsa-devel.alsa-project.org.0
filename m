Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591923993C1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 21:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB49716F4;
	Wed,  2 Jun 2021 21:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB49716F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622663089;
	bh=hFzwaBn52c8chiZEx0CD7h9xsNzUro718q7SdbyhAFE=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q+CGCD4OrpruPe3I7+chfZrj4ZSmlSHdsBFn7pxID4gQfzmqipEhSPmORqQacEKs0
	 JqKQL0F1j3zuZGR/f7jdO0k8ZC/P86xmBnCFOyapCNWM/6HsjLGo5OIceE5PIYYLKY
	 vreykGItIBAeHFdNPnkrqKM1nmYruOyTT34R9YPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D097F80425;
	Wed,  2 Jun 2021 21:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4FDF80424; Wed,  2 Jun 2021 21:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.nosuchhost.net (mail.nosuchhost.net [78.46.40.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B72BFF80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 21:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72BFF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nosuchhost.net header.i=@nosuchhost.net
 header.b="PcTlgK9h"; 
 dkim=pass (1024-bit key) header.d=nosuchhost.net header.i=@nosuchhost.net
 header.b="jDIMZuw7"
Received: from localhost (localhost [127.0.0.1])
 by mail.nosuchhost.net (Postfix) with ESMTP id B9EDA40841;
 Wed,  2 Jun 2021 21:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.nosuchhost.net B9EDA40841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nosuchhost.net;
 s=default; t=1622662993;
 bh=O33DXF2bqvpXummyyFLW9USOtd+ctXWL9Fxt41v/AZI=;
 h=Subject:From:To:Cc:Date:From;
 b=PcTlgK9h+V0bNYbS12upbO/S5XzzXUsINSbVgOketYtGsTrHavFBgChH/Sw1fSp7j
 tvUnrUAP77oIQLWU9EJXWdhX1ZCJpvl4VTU2KiAJNqfgCWPG0LcMGaUrG7RLmGciiD
 l3/EeVa1YRkSgYYtILqQFOwEiOUj6/tybtDhmI34=
X-Virus-Scanned: amavisd-new at nosuchhost.net
Received: from mail.nosuchhost.net ([78.46.40.125])
 by localhost (ns3.nosuchhost.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5m+V+9P1ZHcV; Wed,  2 Jun 2021 21:43:11 +0200 (CEST)
Received: from [192.168.88.42] (91-119-17-62.dsl.dynamic.surfer.at
 [91.119.17.62])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.nosuchhost.net (Postfix) with ESMTPSA id 1C209407FB;
 Wed,  2 Jun 2021 21:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.nosuchhost.net 1C209407FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nosuchhost.net;
 s=default; t=1622662990;
 bh=O33DXF2bqvpXummyyFLW9USOtd+ctXWL9Fxt41v/AZI=;
 h=Subject:From:To:Cc:Date:From;
 b=jDIMZuw7vNTAXO60NZOu/DUYyrq+cymcH7Pd2+d/gud62TfTXs0EfbRGJAvu0s95I
 P/lwmRlxfSddHhtU6a9T8tpTbboQfpHCy0I7dxwg6Ha2rY7nkrTCsSe0gAwAOoRBue
 q6AE9CSu6NwkWNESVqjV+Ph/9VDw+dhS3k9oxlIA=
Message-ID: <c4600eb1c616b891fadc8c35c440c43f4836f3a1.camel@nosuchhost.net>
Subject: trivial patch
From: josef radinger <cheese@nosuchhost.net>
To: perex@perex.cz, tiwai@suse.com
Date: Wed, 02 Jun 2021 21:43:09 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, trivial@kernel.org
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

just fix some trivial typo in comments, sorry for the third try. now
the direction between diffs is correct.


diff --git a/sound/soc/qcom/qdsp6/q6adm.c
b/sound/soc/qcom/qdsp6/q6adm.c
index 1855b805eba2..3c68df82c95c 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -373,7 +373,7 @@ static int q6adm_device_open(struct q6adm *adm,
struct q6copp *copp,
  * @rate: rate at which copp is required.
  * @channel_mode: channel mode
  * @topology: adm topology id
- * @perf_mode: performace mode.
+ * @perf_mode: performance mode.
  * @bit_width: audio sample bit width
  * @app_type: Application type.
  * @acdb_id: ACDB id
@@ -452,7 +452,7 @@ EXPORT_SYMBOL_GPL(q6adm_get_copp_id);
  * @dev: Pointer to adm child device.
  * @path: playback or capture path.
  * @payload_map: map between session id and afe ports.
- * @perf_mode: Performace mode.
+ * @perf_mode: Performance mode.
  *
  * Return: Will be an negative on error or a zero on success.
  */




yours
josef



