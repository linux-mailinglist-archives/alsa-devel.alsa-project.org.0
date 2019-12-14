Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF911F522
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Dec 2019 00:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC621672;
	Sun, 15 Dec 2019 00:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC621672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576367974;
	bh=FoidPWznw6EN2j/wTIfLH3Tji7Av+MvKoA4I9pqPHL8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VXCQ6EhDMeM/YvmVlAp6p0VFyHQchRzpbO4E5hh0BkQqBhu0rIlNmPrMAvMj1Rzrg
	 anhYG/tUMSe6/evDNYQsIuHuP6XNmM/zyz65I1uQEgUsoS4dLFGUsApd5Wiotcrf18
	 jkDxZyaqg0CwudqWtV/ZwBxdYsDBmb25cK9NmSM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02B01F8014F;
	Sun, 15 Dec 2019 00:56:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EBFCF801D8; Sun, 15 Dec 2019 00:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21405F8020C
 for <alsa-devel@alsa-project.org>; Sun, 15 Dec 2019 00:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21405F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="ul6+azKb"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Xl17KUZs"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 16D874E2010;
 Sat, 14 Dec 2019 23:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576367770; bh=OE2q7G5w+gUU1C7/rX6Xuismn9WjG5TfxVmkrDQuwXU=;
 h=From:To:Cc:Subject:Date;
 b=ul6+azKbYZ8Wbd5gr7pxrO0VWZV19FsVik25I7v8wU8F4u5hPpx5Nr27IQvHlfHOE
 Azl+0lN542/PtBaSq7T3xDlS8NLj7T65RFwwf7JloZeQMSis2OVUwQCE5ZqlpNmnOe
 tmPtihpMhadRGJauTlvZKxkHzQpD7SVXtANzjTWA=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDDI7EDyHAcL; Sat, 14 Dec 2019 23:56:09 +0000 (UTC)
Received: from thinkpad-tablet.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 8FAF54E2003;
 Sat, 14 Dec 2019 23:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1576367769; bh=OE2q7G5w+gUU1C7/rX6Xuismn9WjG5TfxVmkrDQuwXU=;
 h=From:To:Cc:Subject:Date;
 b=Xl17KUZs7x1M6c5rJr8TMopeaiUP3PdC4Rz/rX4Ih8pmCtdQXSgVW+53S1DTEQPE1
 yTGU2eoMAEJvgqBT1/0PSwyeTp0Vo6ky8FNhj2Fm6doIJyC3+LfkpJ3nQTIIJBbKPz
 u+0GJSjMHnuYOV9h/Al12/T4WUZlCgbs6OScuC/M=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: Mark Brown <broonie@kernel.org>
Date: Sat, 14 Dec 2019 15:55:48 -0800
Message-Id: <20191214235550.31257-1-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, kernel@puri.sm,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH v2 0/2] Add the broadmobi BM818
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

he broadmobi uses slightly different parameters from the option modems
so add the paramters and document them.

Changes since v1:

Cut back the CC list.
Use data from compatible match instead of explicit compatible match.

Angus Ainslie (Purism) (2):
  sound: codecs: gtm601: add Broadmobi bm818 sound profile
  dt-bindings: sound: gtm601: add the broadmobi interface

 .../devicetree/bindings/sound/gtm601.txt      | 10 +++-
 sound/soc/codecs/gtm601.c                     | 46 +++++++++++++++----
 2 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
