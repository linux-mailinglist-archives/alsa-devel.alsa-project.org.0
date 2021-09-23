Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5F415763
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Sep 2021 06:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A2D15E5;
	Thu, 23 Sep 2021 06:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A2D15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632370937;
	bh=Ai8sE5Hc7UhdXP4QNOkNkcoLS5AzqNo7b1Z+k6dHWKc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWshPG3LjoEPoLGL+9cA5V6UmhgEhfnQTaq3ekwdj3yiLqmwJtHIHUD8PLvQkzTew
	 eGQAjVtJzpXaiSiQ4ZkLbcJok2CBIge1p6PGUOGtuhCC07xi9AyOx/doiGs4lwQJwo
	 kTFrz0MJo2hTB+pRIhlZbx072W/+HcI9czx+Vbls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC025F8025F;
	Thu, 23 Sep 2021 06:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 347FFF80268; Thu, 23 Sep 2021 06:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4250FF8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Sep 2021 06:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4250FF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="iYIe6YFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRs8+EJhY91KpYhRt0sgOiImQScEqeRR+loMXF+RbacO/zsolO+IYtkJql680RTYIEyCywZxKti/ok0YnzEGhLW1oCoAAbbvosP1V29+T9JI/fyDzUfONJQms9K24wL1YoBIcUuONHyC3L2YI7VACrPsP3dg/wPu8El/ugeoXeoWy+9S5+oG9JqvmkfG0/N3PIJwYISrLKbaoP7CCuI5525GdidICL6b0x5KSuUvbUo5MVy7m10ZwVRka9IYy6trIIEXk+xEhErhPhUnU8W+uVp0BeuNhKsE1E8mW/O1wLvhmHNLxLJIUzO2uEqU6Xjbo8plQoUZDBIxBIXeCkXa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rDgtMoUhboKCGPVyaqJEv7sHDX1Hjp3948zFYjy7JM0=;
 b=iU8TFSAGEULPNhq/xH1xAaw9YGyuwWfGhxbKTwch4OTDuAsU8ohGd3BcNKgOuT+TrZzjrUcBr+Opohk1xsc75BW980Aw7uTU03NpbdXsp1DvtaRPHElFgbLTA/ZVYPAv0eMESiATMahYi6i9+VgBpx+5TbuVDojDlpWq4T2XooPRtoBxmDtnpThh/ruSM6QNtjPPAiDTDmg6D71lGIXy8XBeSTHEYS4LnbCen7uQl0lZxntLNy9yVXwmBfW9NO1fq8+z/lOdq2eh5xjV1V61mHZn2zXwkO/TrnvdGY9LBhM7otN35ri7VB2uQ/ZwSkgjwbjx+oUlohNW3BnRs79e1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDgtMoUhboKCGPVyaqJEv7sHDX1Hjp3948zFYjy7JM0=;
 b=iYIe6YFmUy5NkfotHD2oNsyqbIocjAsaHKaivX6lmT1JPjw/lGJ7OZGD5OJnZ8SUV+Fris9wL9+q7eA0uZnyrMMqEisTLRS/RxUqaK6+Yr8lvr3DmO2a8nQeE2SGsCG8T32S86xo7fuWcV8xDsW4mydiatig/zHQi5NJBO4bDAeGTfdlvPwIB5RPBo1tLjOulTeQZCpsUAFfjeCPAXgzLDc2q68omKM9T/lKND2wKTuSEmUWzxfHpA5F3XgX8G5PwQ+3orXTglVOj7LtJvUYdJY06hUWRF5btWNn2O/rX7UIcNVeT+Q+AvRvvbsW8pXY7IdRvcsKqui+hStT9ZpAkw==
Received: from BN6PR16CA0011.namprd16.prod.outlook.com (2603:10b6:404:f5::21)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 04:20:46 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::13) by BN6PR16CA0011.outlook.office365.com
 (2603:10b6:404:f5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 04:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 04:20:46 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 22 Sep
 2021 21:20:45 -0700
Received: from [10.25.97.189] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Sep
 2021 04:20:42 +0000
Subject: Re: [PATCH] ASoC: tegra: Constify static snd_soc_dai_ops structs
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <73afcb2c-3ab3-8fe9-2d66-ee6ab9497089@nvidia.com>
Date: Thu, 23 Sep 2021 09:50:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef6aaa2-c64c-4db4-42da-08d97e498424
X-MS-TrafficTypeDiagnostic: CH2PR12MB4152:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41525C6F0A28B36FC9650CE4A7A39@CH2PR12MB4152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OcEqd/LFKvooqYxeEENPOujhHss+GHC+Vc95QAbf7QOxzavKWguPllQyRK5W8Xy5FrlGfHNxVHqJuDHpBsEWdbrMwlx+pMlQyYZqWypjoz7AxWLBsFtg8jgmwm2TBOmqchgmbWUplENSccBP3sxvMwwXh8ubFZxrHTyOcO/sQFsDxi4LZK/ylodKtXWH1uGeUvrE8pwsnEK88tjJfMI5W+W+FaCR4/kqtoU2oBU4VoWHzEpWISuvi4lwVHcWtsO+sB5blAz6ISfJBr18NoNzWraM/EtL3AeGbOuf4n6xi9yvjKq1X5vb+SxiopDZcZKT1hhxaE3WxhXNRKIBJHiP/wWKFZYFe31GkyEQCwuPpKKLA5PQqongFYriC+h+TU6gKsuTiTQDkulj73B2FvchYkRYRGca+lHdbt9N7oM0uMtsIN8+UsgnrbM0aK91/+6TxuD5TJx2N+Cjq5oyOK/YSg5qYzs/AW+rMs371xCR/poaMwYLIcqEGOVN1oBS6XScpKJ5fsQLyALSrCxnXBZwkWkDIF39QxYL+HxcpVtb+mWjWuYif6gVAYPEu5NjkL2HBbx4fyMn4dl/jzpQ9Vs5WS4iwTIKewtkNpNlpAyfk6p63gJwrCWUlsKGh1udqM09wTSS2TuW2TiUxg8CYNNti/5oqXQhb1KPygy53ZlslPwQAD9WbtZpixCsJE5slofWOtEoPCFqb4WqWzgm8R85zpOGiqA9tbJwrodNqr+BlGM=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(16526019)(16576012)(110136005)(2906002)(54906003)(8936002)(426003)(336012)(186003)(316002)(31686004)(36860700001)(26005)(4744005)(4326008)(47076005)(53546011)(82310400003)(508600001)(70206006)(36756003)(356005)(83380400001)(86362001)(31696002)(7636003)(2616005)(70586007)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 04:20:46.2708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef6aaa2-c64c-4db4-42da-08d97e498424
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry
 Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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



On 9/23/2021 2:24 AM, Rikard Falkeborn wrote:
> The only usage of these is to assign their address to the ops field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>   sound/soc/tegra/tegra210_adx.c   | 4 ++--
>   sound/soc/tegra/tegra210_amx.c   | 4 ++--
>   sound/soc/tegra/tegra210_mixer.c | 4 ++--
>   sound/soc/tegra/tegra210_mvc.c   | 2 +-
>   sound/soc/tegra/tegra210_sfc.c   | 4 ++--
>   5 files changed, 9 insertions(+), 9 deletions(-)
>

Thank you Rikard for the patch.

Acked-by: Sameer Pujar <spujar@nvidia.com>
