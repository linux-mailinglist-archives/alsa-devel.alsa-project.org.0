Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E722126F7A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 22:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EFE15E0;
	Thu, 19 Dec 2019 22:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EFE15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576790015;
	bh=5Y0sWXIETd2dgT1EC1kG1pk9dnjvOTI0wj0AUtUxjFE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A0q8H1XNYM9eKti9NzCAjsSnOioiu+s4WiP2JLb6/AAbyn72QlmjiHO3xhZ1UyyoY
	 B/TUORNs6E4oB9hSA/vmjdFFuYByKm03ZTzCVWtv1swPa0H3tfwb2sEL/aDI6AFJoB
	 S6jSv8nvCnU4E3cbl/rvpbyO7XmWwhZLSHkI2OG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF2AF80271;
	Thu, 19 Dec 2019 22:10:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED2DF8026A; Thu, 19 Dec 2019 22:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1236F80234
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 22:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1236F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="baRoBN8Y"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="baRoBN8Y"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 856564E2010;
 Thu, 19 Dec 2019 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576789801; bh=TDb2mIF0Kmrb+qb9673eOhT31g+D8vn8VUifumGYZy4=;
 h=From:To:Cc:Subject:Date;
 b=baRoBN8YsGPPc6Z+lXJVr/GhZ2lsmwlxGzGXOiQDN+DM6K4C+3pUE0GRPq2AHh/Zg
 NIaliwO947aZXcUjx2EG23XmIuCzt2IpcMDEeVRFvTLEzDnUK+GE+fhOVPUAhcISP9
 EtJwMQ3v1QLKzuIH33sBWs0mLDEsGcrnZ8pYR7OM=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJ-Fhp2u47C0; Thu, 19 Dec 2019 21:10:01 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id CFC9D4E2003;
 Thu, 19 Dec 2019 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576789801; bh=TDb2mIF0Kmrb+qb9673eOhT31g+D8vn8VUifumGYZy4=;
 h=From:To:Cc:Subject:Date;
 b=baRoBN8YsGPPc6Z+lXJVr/GhZ2lsmwlxGzGXOiQDN+DM6K4C+3pUE0GRPq2AHh/Zg
 NIaliwO947aZXcUjx2EG23XmIuCzt2IpcMDEeVRFvTLEzDnUK+GE+fhOVPUAhcISP9
 EtJwMQ3v1QLKzuIH33sBWs0mLDEsGcrnZ8pYR7OM=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: broonie@kernel.org
Date: Thu, 19 Dec 2019 13:09:42 -0800
Message-Id: <20191219210944.18256-1-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, kernel@puri.sm,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH v3 0/2] Add the broadmobi BM818
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The broadmobi uses slightly different parameters from the option modems
so add the paramters and document them.

Changes since v2:

Use of_device_get_match_data to get the dai data.
Updated subject styles.

Changes since v1:

Cut back the CC list.
Use data from compatible match instead of explicit compatible match.


Angus Ainslie (Purism) (2):
  ASoC: gtm601: add Broadmobi bm818 sound profile
  dt-bindings: sound: gtm601: add the broadmobi interface

 .../devicetree/bindings/sound/gtm601.txt      | 10 ++++--
 sound/soc/codecs/gtm601.c                     | 31 ++++++++++++++++---
 2 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
