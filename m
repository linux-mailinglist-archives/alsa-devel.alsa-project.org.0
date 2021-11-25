Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F5345D9FF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 13:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA8D189C;
	Thu, 25 Nov 2021 13:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA8D189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637843222;
	bh=omdE/nB6bUgWq5/VLWmDiCDlqQ9gXbnDEoKoj0VujXk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOsCnepLGx4edQovrmDDxFmvO+RliHSA7B24MQ1LgsJj9/ab5eB33Jc/PLb44suAg
	 ZJq/YCao0r61i6tu8ZMPUzP0P4QBlpfoh5lyHU0umE2X+w1+o5nykYAsuDXleflDo9
	 SZjNHPvGJtnxlt0mq+q5wP/EupiylUZ66vzQVM+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9902F804AB;
	Thu, 25 Nov 2021 13:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12343F8049E; Thu, 25 Nov 2021 13:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5B4F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5B4F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XRjA+ZV0"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1APCPW56029759;
 Thu, 25 Nov 2021 06:25:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637843132;
 bh=ae2djdnrcrZIuXucMfsmSmeQEtEPEgbPjxeoQkFtEOM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XRjA+ZV0XppUYhbYVb5gwGRajRlNu4I07SbnFgsYc+zNUAjY1bhWMv50eDt1EuiPq
 Rr2l99n9DZB8VsvY5r7resWVBLEIMHjldLO1RVC758IfZEJG+GMJLxubxFA1vYA4Ff
 pkP9fY2I30emv8609zCtl0NAlCStHg8a699opi4M=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1APCPWN3073062
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Nov 2021 06:25:32 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 25
 Nov 2021 06:25:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 25 Nov 2021 06:25:31 -0600
Received: from [172.24.145.91] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1APCPTe1006147;
 Thu, 25 Nov 2021 06:25:30 -0600
Subject: Re: [PATCH v2] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: <robh+dt@kernel.org>
References: <20211125121521.31554-1-j-choudhary@ti.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <6af6a1c5-6b5e-fb35-a9c7-3314f936994f@ti.com>
Date: Thu, 25 Nov 2021 17:55:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125121521.31554-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 25/11/21 5:45 pm, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs
> from txt to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains'
> '#sound-dai-cells', 'num-serializer' and 'port' which were not there
> in the txt file.
> Adds 'dmas' and 'dma-names' in the example which were not there in
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>    'dmas', 'interrupts' and 'interrupt-names' according to the
>    arm SOCs
> - adds 'port' and 'num-serializer' as node properties.
> 
>   .../bindings/sound/davinci-mcasp-audio.txt    |  86 ---------
>   .../bindings/sound/davinci-mcasp-audio.yaml   | 179 ++++++++++++++++++
>   2 files changed, 179 insertions(+), 86 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml

Rob, Mark,

Previous reply on v1 patch had irrelevant quoted text so here are the 
necessary comments:

- For the arm64 SOC errors in the dtbs_check, a patch has been already 
sent: https://lore.kernel.org/all/20211117053806.10095-1-j-choudhary@ti.com/

- For the typo error in the dts file which causes error in the 
dtbs_check: 
https://lore.kernel.org/all/20211125105326.17000-1-j-choudhary@ti.com/


Jayesh
