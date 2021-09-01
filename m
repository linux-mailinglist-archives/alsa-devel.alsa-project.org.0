Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D810E3FD444
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 09:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F4F1661;
	Wed,  1 Sep 2021 09:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F4F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630480292;
	bh=txeXbP/Z5psgYdB0Q2V6TZal66WcqoY4eB8tqk9dwaI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EICpEGTu/y1ddwcA8aBl9Blbkv7ZHyDyfjNgCh+LPT1UFrbwNpqexjXadh1pSZSEo
	 gxDjdYT6TRBhOxuASE2A+7O4Re+mWL25V510Zd0N8TQJrT6tIoIHRjwVq9YYEBtPdy
	 E9jsr+sTH1jEoa8lbkoXUkrpJc895drzgPwxJExY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D949CF8020D;
	Wed,  1 Sep 2021 09:10:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A36DF8020D; Wed,  1 Sep 2021 09:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B4E5F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 09:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4E5F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="oJR2E+mb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG4RTIUgXTAxhmytBseEuajvWgESjQmu0XTCJJlNOqrDIPf6R3pry+756Oo+kZAnk7KXk2Ayouf2qpBT1xsjMhVnT78uKOM863n3QU0iCJvAgI2L3emjxvaShsBynPCfNkWrC6cP5SAIlgcRGgNg9TQDB0bukALOkhENrGwLof8MPIYwT4VycpoHfnWKEvpSXTIYpIitvt9LylmkFJBrPpRAhwLyBseDgsoQLTNAZk86b/M9lFp0lcO++sQoojBc//U0intp/9sLitRysxWJtn6mfPV6dWvwXme8XDUB0+ctmY1xuypirUhITZ/cob9Jx3z2hWWA/1W/Xgy/xwVw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSdNqYmcDkeAP21Rwh1JHsKOVIxb2RSndOvEOgwdpFg=;
 b=VjgBpMmWh628BAs861WHJdPmp1RQE+XdJJ9fXDgPlIRGTzAD19o7dayXnPo2n1enY5O23HKeL88x8KfRJlwJxpuDkBsJa25mcONLcDDa1tdiet32KUs5OmPvfZIPMVst6fKl51GZhpfOK9di+LcYX/QpY21K5jQo28oq2x6Y/tgMBB4rmyMJ8u/jYUP3Vc7bDqDQgZSMHhiquC5LmQDoLnkF19LV2SclupewxmrbHGc+O6cUXmkxrlobNEQQ8bRJ0WBKuDTLFEO+BbQJRwBurdki8pgqiU2RyXln50s3+G9Bt6oRuB3u+PYid+8JNIJVv1Scvi8jlFAiC0+TpBw/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSdNqYmcDkeAP21Rwh1JHsKOVIxb2RSndOvEOgwdpFg=;
 b=oJR2E+mbJ31T5vL5A2zRkYTHcgcfvOqXz85QDFn0r2Dge+2f0WFS2PS0/cooGern7THyAHaIW089/bYmYyPXjyMxvv5ntcNLHxMX5M1cu628IGsSXGWY3q/htBoDmjP4uQfrnrfN3nfHzf9MN9ZTwz3DC+zPWxkGdpUzChUjiHr59e9bfXasWf+bRmDkrjVDFPw2SA/1oVdMmFCmUloMBcs6IjM6Sk1IgBDYVJTcd9aYxpxfEw6mQJXHS5n0gr4CgctcdMUTpImLuivU0MV8AdN1gbkt6xXrCBlNSdMViUsFSXO1bxFOAJdVGAvxXBXibFdwjKQNJElD5XafBTe2mQ==
Received: from MW4PR04CA0178.namprd04.prod.outlook.com (2603:10b6:303:85::33)
 by BN6PR12MB1684.namprd12.prod.outlook.com (2603:10b6:405:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 07:10:02 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::ac) by MW4PR04CA0178.outlook.office365.com
 (2603:10b6:303:85::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23 via Frontend
 Transport; Wed, 1 Sep 2021 07:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 07:10:01 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 00:10:01 -0700
Received: from [10.25.98.106] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep 2021
 07:09:56 +0000
Subject: Re: [PATCH 04/13] ASoC: dt-bindings: tegra: Few more Tegra210 AHUB
 modules
To: Rob Herring <robh@kernel.org>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
 <1630056839-6562-5-git-send-email-spujar@nvidia.com>
 <YS6PTYwwu9tU8TWX@robh.at.kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <47f1d2ad-40a1-4c8f-8658-11328d41ee1e@nvidia.com>
Date: Wed, 1 Sep 2021 12:39:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YS6PTYwwu9tU8TWX@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09f0a398-3217-4ae7-1268-08d96d178433
X-MS-TrafficTypeDiagnostic: BN6PR12MB1684:
X-Microsoft-Antispam-PRVS: <BN6PR12MB168410345C4D6333C105BC7BA7CD9@BN6PR12MB1684.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnJuKOsdnuuFV12bjN/9i1NkCO4689q6Wx1Vr5yndDYSohRyPVDXOumabigQYkwg46NgYjohdiiBfQ4b5bKA0L6KIv7fP/FxJ3Lkzi+JfRke/kXqQEt01jTz0o7hXuHOYJ+D5Qkir4MpES+QR19F1DSdphz+/TW73TyHJFmd1xtXiAJ/fQMKmU8mJMxHaAhcVtswN3qtYFmMXXd6ddiiBWK6Y5bZb80hhQgTkhqU2XPsWHp+Clwt37oW0Nej062UoPSH6mlkzMNEC4EoZy51a9cbXPndFcZyzSEzDvIKcrzvIT1YHJy8C/HnjBbucGQCMcvgTBcJ/L/riMa7DzbaI2AgPehc+z1/JtPvaHFr7XvqwkEwO4bTHU/L2kRwokHidchqKQAfvjbrYlol+wO0R3WwFP12aDooAzkMa/VOQODjjIlmdCZ4LHsEdg7h3lY7ljcPdid9zmLN9dSTeEbcVTwpAocT2OYD1caJU0oW2a1KeTptI2d7Ux1xipOErmbWeEWwyqNpdTZTVu2TMTvgUL6DoX3WP3FviV0GG7YWsbwHKu6+M1JMA8fBkf9ORq7wYkUSLOiP0tHxMph2j78oBr+U0TTb73u0faDN/wsqTC09jNILQQA9Ln4FIlDBEgWq4kzcxj1kAVXkPSM9GQocSXO0JBVfbHW+0miPpFnA/T8u/BJNzRoVuaxjVJXRWfs3dJ62EJYbOdqMtKaWHLdDPAUOh3W6hLV0/wxFTDHiUL4=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(36840700001)(46966006)(186003)(31696002)(26005)(82310400003)(16526019)(6916009)(47076005)(31686004)(2616005)(2906002)(7416002)(36860700001)(4326008)(478600001)(336012)(426003)(16576012)(82740400003)(7636003)(70206006)(5660300002)(70586007)(53546011)(8936002)(86362001)(8676002)(316002)(54906003)(36756003)(356005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 07:10:01.8001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f0a398-3217-4ae7-1268-08d96d178433
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1684
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 broonie@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, sharadg@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Rob,

Thanks for feedback.


On 9/1/2021 1:51 AM, Rob Herring wrote:
> On Fri, Aug 27, 2021 at 03:03:50PM +0530, Sameer Pujar wrote:
>> This patch adds YAML schema for DT bindings of few AHUB modules.
>> These devices will be registered as ASoC components and bindings
>> will be used on Tegra210 and later chips. The bindings for below
>> mentioned modules are added:
>>
>>   * SFC (Sampling Frequency Converter)
>>   * MVC (Master Volume Control)
>>   * AMX (Audio Multiplexer)
>>   * ADX (Audio Demultiplexer)
>>   * Mixer
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> ---
>>   .../bindings/sound/nvidia,tegra210-adx.yaml        | 74 ++++++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
>>   .../bindings/sound/nvidia,tegra210-amx.yaml        | 72 ++++++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-mixer.yaml      | 67 ++++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-mvc.yaml        | 79 ++++++++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-sfc.yaml        | 76 +++++++++++++++++++++
>>   6 files changed, 388 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml

[...]

>> +  16 channels and demultiplexes it into four output streams of up to 16
>> +  channels each. A byte RAM helps to form output frames by any combination
>> +  of bytes from the input frame. Its design is identical to that of byte
>> +  RAM in the AMX except that the data flow direction is reversed.
>> +
>> +maintainers:
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Mohan Kumar <mkumard@nvidia.com>
>> +  - Sameer Pujar <spujar@nvidia.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^adx@[0-9a-f]*$"
>> +
>> +  compatible:
>> +    oneOf:
>> +      - const: nvidia,tegra210-adx
>> +      - items:
>> +          - enum:
>> +              - nvidia,tegra194-adx
>> +              - nvidia,tegra186-adx
>> +          - const: nvidia,tegra210-adx
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  sound-name-prefix:
> nvidia,sound-name-prefix

It is supposed to be 'sound-name-prefix' for core to parse and apply 
prefix. May be this needs to be directly referenced from 
'Documentation/devicetree/bindings/sound/name-prefix.txt' after 
converting to YAML, which can be a separate commit?


Remaining comments will be taken care in next revision.
