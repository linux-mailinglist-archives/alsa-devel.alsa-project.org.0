Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7C24410F5
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Oct 2021 22:12:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F26169C;
	Sun, 31 Oct 2021 22:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F26169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635714746;
	bh=akLm6mpjT90D/3YVJPqQM1JvsIyznVLKAosT+ZJ2Bno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kPAixSgJN+9dC/k3iwSzE/fv4SQcyDxo3uLRKlBydvy7ifPAxK0sdJacb4kXRN4Lo
	 erb/Ry+XMZvHFtZW/ZRQmKOgE3rYIdhS34E4xE7roCDW5roi1Ln/QiIcVCg11LIb0f
	 ZfOt9ZYvAXVO3pR5b90RH4fyAhBJpCri1FJHIO/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3760F8049C;
	Sun, 31 Oct 2021 22:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F0BEF802E8; Sun, 31 Oct 2021 22:11:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0C15F8025D
 for <alsa-devel@alsa-project.org>; Sun, 31 Oct 2021 22:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C15F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="UrsGd5fO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635714614; bh=akLm6mpjT90D/3YVJPqQM1JvsIyznVLKAosT+ZJ2Bno=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=UrsGd5fOdGCQELdy90i+J9MMHqBdO8MB+WbEwvni9iXsWue0iSOtFVF96E0G1CbTP
 i1ADq6bwiijnlgp1kHdwiszCnFciGXnJsnkxX6g4vpElMyS4EcUf8zlcAnEmlSBS5s
 qFQ0J52+u/9ukhzG8PLrKNAMHOWSXIdsq3H/DrK0=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 31 Oct 2021 22:10:14 +0100 (CET)
X-EA-Auth: 1WIvScNvxc5QIVSNyo9KlBZg6hqEvdYfHkhllM9TSu8uqh1lDXo64Vp8jZN18LegR6aq73WPmW96r/9n7bU1IEVpxxHKVDjHA1pqUjqg7/U=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 0/2] Add tfa9897 rcv-gpios support
Date: Sun, 31 Oct 2021 22:09:54 +0100
Message-Id: <20211031210956.812101-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vincent Knecht <vincent.knecht@mailoo.org>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

This is the continuation of a previous series [1] where
- patch 1/4 is removed in favor of using pin switch
  This will be posted independently of tfa989x support,
  since it mainly require changes to sound/soc/qcom/common.c
  and device DTS.
- patch 2/4 is already merged
so here are reworked patch 3/4 (bindings fixed and example added)
and patch 4/4 unchanged.

[1] https://patchwork.kernel.org/project/alsa-devel/cover/20211024085840.1536438-1-vincent.knecht@mailoo.org/

Vincent Knecht (2):
  ASoC: dt-bindings: nxp, tfa989x: Add rcv-gpios property for tfa9897
  ASoC: codecs: tfa989x: Add support for tfa9897 optional rcv-gpios

 .../bindings/sound/nxp,tfa989x.yaml           | 41 +++++++++++++++++++
 sound/soc/codecs/tfa989x.c                    | 20 ++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.31.1



