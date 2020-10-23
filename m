Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D32970DD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 15:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CDA11835;
	Fri, 23 Oct 2020 15:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CDA11835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603460870;
	bh=PcFw2dWNWVz06KOpZkRflYxFHNZJr72LcOtxsk4i3E8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6OoqWhsT8BAmKM7YVNQJEvmgFQpmZtrPLeqhsyoJjH+SYiSsvIg80KWTXmE/Ry3h
	 Jbz7KBGzrybkr4Xs9EFq9iOKM+yMvrF/fJ9QRQmgT2gWvrPK1/zmRTs2NXUYBZGhXp
	 gpofioyhYlrcIwScidnFH5CvA8phKQ0JyjMae0Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4E0F80245;
	Fri, 23 Oct 2020 15:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53AD2F80253; Fri, 23 Oct 2020 15:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D5E5F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 15:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D5E5F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="P+mXkpL3"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f92de6b0002>; Fri, 23 Oct 2020 06:45:15 -0700
Received: from [10.25.102.106] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Oct
 2020 13:45:56 +0000
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-9-git-send-email-spujar@nvidia.com>
 <20201019215628.GA3650804@bogus>
 <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <9cea202e-6ffb-c9da-d9c0-debc351fd944@nvidia.com>
Date: Fri, 23 Oct 2020 19:15:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603460715; bh=xEanTRCOYabNAppmF/+BLQC44ZrW3FYCtdF8/+89DCo=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=P+mXkpL3P8Yckwuga28igVEQhM0NlLpL0YNCr9SXLwURhQYJZpYQStl24TUoJ54E1
 wB+hizDdXiwDup9Drb3CykEYfZOZmSfj2Eo5gdKet1ENTH5AiPAg2jQlT2NN/EA7z9
 rEOObWzslgQPhs5UYie/6WPc9mMrAK6nGnjArdN7GtiX4Yj2p7M5PI8ayRMhb5JqP3
 vTAXxwCTDQR1syYDud+GyXz7o3BXZQ8Ny+ZmkHs6tiGezIVj6++nEH6lBf087sJcYo
 CzE12yAY8dhDxnonWrNUSLqL0TaEKZwpxGXf1CALvKaRNM60a1ofgsy0ndzis+6gOP
 opcv5TrtwfSgA==
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, tiwai@suse.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, devicetree@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>   Documentation/devicetree/bindings/graph.txt  | 128 --------------------
> The removed Documentation/devicetree/bindings/graph.txt is referenced by
> a lot of files, tree-wide. Should the references be updated in the same
> series?

May be possible to include in the same series if it is just about using 
'graph.yaml' reference instead of 'graph.txt' in various files.

...

>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/graph.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Common bindings for device graphs
>>> +
>>> +description: |
>>> +  The hierarchical organisation of the device tree is well suited to describe
>>> +  control flow to devices, but there can be more complex connections between
>>> +  devices that work together to form a logical compound device, following an
>>> +  arbitrarily complex graph.
>>> +  There already is a simple directed graph between devices tree nodes using
>>> +  phandle properties pointing to other nodes to describe connections that
>>> +  can not be inferred from device tree parent-child relationships. The device
>>> +  tree graph bindings described herein abstract more complex devices that can
>>> +  have multiple specifiable ports, each of which can be linked to one or more
>>> +  ports of other devices.
>>> +
>>> +  These common bindings do not contain any information about the direction or
>>> +  type of the connections, they just map their existence. Specific properties
>>> +  may be described by specialized bindings depending on the type of connection.
>>> +
>>> +  To see how this binding applies to video pipelines, for example, see
>>> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
>>> +  Here the ports describe data interfaces, and the links between them are
>>> +  the connecting data buses. A single port with multiple connections can
>>> +  correspond to multiple devices being connected to the same physical bus.
>>> +
>>> +maintainers:
>>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>>> +
>>> +definitions:
>>> +
>>> +  port:
>>> +    type: object
>>> +    description: |
>>> +      If there is more than one 'port' or more than one 'endpoint' node
>>> +      or 'reg' property present in the port and/or endpoint nodes then
>>> +      '#address-cells' and '#size-cells' properties are required in relevant
>>> +      parent node.
>> reg property.
> What about #address-cells and #size-cells in port and ports nodes?
> These must either be #address-cells = <1>, #size-cells = <0>, or they
> can be absent if the parent node already has the same, or if a port node
> only contains a single endpoint.

Yes, will list these properties for port/ports.

...
