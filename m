Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3D2D3C1E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 08:24:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9BF516DF;
	Wed,  9 Dec 2020 08:23:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9BF516DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607498660;
	bh=AnHzJPjtBQ5MWsrKAvuFGKy6O/3lWY/FmGU10befUzU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h5CPIKSDwiKFXyTKy3a8U7gP1ZgZtgf7L6b+oG9DXjbhO6YFKkMJf9sVX1JGNWkSu
	 RgVZxvKqJF70FTimatofOR6hlwvnNSB6A3e+eIuui+FldiDHkl7uoHTLa9r30c2evI
	 0hwS16YPW7iwFAUybWOBqzoWuG/4/YMhkD8tUMqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA66F80217;
	Wed,  9 Dec 2020 08:22:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AEE1F8020D; Wed,  9 Dec 2020 08:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E152F8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 08:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E152F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="dHQv48V+"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fd07b360001>; Tue, 08 Dec 2020 23:22:30 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 07:22:30 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 9 Dec 2020 07:22:28 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH] ASoC: audio-graph-card: Drop remote-endpoint as required
 property
Date: Wed, 9 Dec 2020 12:52:12 +0530
Message-ID: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607498550; bh=z5xavFenRoKMKPK0qwGJtQP0fdSh62QlRJgN6qV4K8w=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type;
 b=dHQv48V+NDFdUQCPpJYA3492Zpdrgew/uYiPtGufbR33O8hJJ5R+clelWILhsyJW3
 yD5u20s1TWNQvqTJ1IT+gO9LsPDxXSRHIJLiodd5HJ5vdoLaB3WLhYzOHqgCMGcxq0
 9aajja2pBwhPHfPxN+eqOpfmB0OXMDd266rLpTc8L2FgxqdLFjhkpe8IcYLHEA4JKU
 BYZQHNhjYxct8+K0/Wou/M3kmWEbrsugJjI5zv5WQBbvT9E8lZvaDZpBnufVYN1P8S
 R+mUin8zt+P15EfesoP/PFzf2h4ECa7dHZa3RqgAHM2Hro/gsCdim2/R+aQtV7Z8KV
 m2FC2TEPfXFWw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Rob Herring <robh@kernel.org>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org
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

The remote-endpoint may not be available if it is part of some
pluggable module. One such example would be an audio card, the
Codec endpoint will not be available until it is plugged in.
Hence drop 'remote-endpoint' as a required property.

Cc: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 2005014..766e910 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -71,9 +71,6 @@ properties:
             description: CPU to Codec rate channels.
             $ref: /schemas/types.yaml#/definitions/uint32
 
-        required:
-          - remote-endpoint
-
   ports:
     description: multi OF-Graph subnode
     type: object
-- 
2.7.4

