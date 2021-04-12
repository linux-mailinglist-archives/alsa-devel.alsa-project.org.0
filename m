Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A835C360
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 12:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23EE1676;
	Mon, 12 Apr 2021 12:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23EE1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618222150;
	bh=IQiEQT4a+uhVB2v/RkA3iitkG63IAZXg4d/BBGK1arY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQaK/ZiR5XfR2vEXbX7A1Kfoggab5NWFi8ThqeZ5moijedFwO9xoq3ozcsZ19R/yW
	 saLxdAQtxdnwEYXAZSmNvbU3p/14zOHEBz9HKccVJ+WCnUXUrGONCVnPbUz+kfUka1
	 dSAkIGReyHRcPZdDgIQPVttW2M350Iluc9QMhTqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49191F8025B;
	Mon, 12 Apr 2021 12:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55427F80271; Mon, 12 Apr 2021 12:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1142BF80269
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 12:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1142BF80269
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FJkql6xP3z1BGkJ;
 Mon, 12 Apr 2021 18:04:51 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 18:06:57 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] clean up dt_binding_check and dtbs_check warnings of
 renesas, rsnd.yaml
Date: Mon, 12 Apr 2021 18:06:36 +0800
Message-ID: <20210412100638.3349-1-thunder.leizhen@huawei.com>
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

v2 --> v3:
Modified based on Rob's review comments. For example, "ports" and "port" are
not allowed at the same time.

For the details, please refer:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2539753.html


v1 --> v2:
The analysis was not clear in the previous version, "$ref: audio-graph.yaml#"
is not required. 

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

 .../devicetree/bindings/sound/renesas,rsnd.yaml     | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.26.0.106.g9fadedd


