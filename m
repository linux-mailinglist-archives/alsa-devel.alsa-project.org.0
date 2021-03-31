Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67A34FC77
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 11:18:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57D261607;
	Wed, 31 Mar 2021 11:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57D261607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617182299;
	bh=QnyBzxTk8l8rBNsAx/w3kk+Lgn5rzvIEJR/Skutadrc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZy2x4fTDoYHVu2q6BzBfBiUWCy4mU4PRv8q22RvP/U1fbCm2g0l/IhYCO4mb/KyU
	 eXrXRQw3BhypD7oLiM5x88Sc9UcWowIayz4cJnyx/6j3AIPREwJqoDENot/91Ph2Zz
	 fEZZWjrsk7OPPM2vuIKFiivks/XGNHQ3d3UO8k7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E36F8020C;
	Wed, 31 Mar 2021 11:16:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E25F801DB; Wed, 31 Mar 2021 11:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15BDF8015A
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 11:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15BDF8015A
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9LHB4my0zyNLP;
 Wed, 31 Mar 2021 17:14:30 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:16:25 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] clean up dt_binding_check and dtbs_check warnings of
 renesas, rsnd.yaml
Date: Wed, 31 Mar 2021 17:16:14 +0800
Message-ID: <20210331091616.2306-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Zhen Lei <thunder.leizhen@huawei.com>
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

It was then adjusted based on the following patch series:
[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/


v1:
When I do dt_binding_check for all YAML files, below warning is reported:
/root/mainline/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dt.yaml: sound@ec500000: 'dais' is a required property
        From schema: /root/mainline/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml


make dt_binding_check -j24 2>err.txt
Before:
cat err.txt | wc -l
2

After:
cat err.txt | wc -l
0

make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/renesas,rsnd.yaml -j24 2>err.txt
Before:
cat err.txt | wc -l
130

After:
cat err.txt | wc -l
0

Zhen Lei (2):
  ASoC: dt-bindings: renesas, rsnd: Clear warning 'dais' is a required
    property
  ASoC: dt-bindings: renesas, rsnd: Clear warning 'ports' does not match
    any of the regexes

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.3


