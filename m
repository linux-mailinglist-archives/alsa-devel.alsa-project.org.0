Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D71000E4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 10:01:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD803168E;
	Mon, 18 Nov 2019 10:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD803168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574067689;
	bh=LKJRfjdyxWavP4JoRyxrh1MKHY2/NmZoxpBltQ4ejUk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4JfTRJ6zZw8NLNxHa8fsrP0Vwt5TJYDSTXoU1vVjSL1ayfEG/Py50RJG3B5VtVrO
	 uAYK7fDiuazBy1ThPl9QCub8pAMlA7+v29abLv98njuoSpbEhdF4D5Sp8dwQCcZEeO
	 cfCiaD1ByUR0DT4BaNUoOk4tmQRT8T8Gzbk0HAYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D80AF8013D;
	Mon, 18 Nov 2019 09:59:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5794F8013B; Mon, 18 Nov 2019 09:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730064.outbound.protection.outlook.com [40.107.73.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C271F800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 09:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C271F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="EKtrEQRF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbmk0jRdWND6pndlfl+WwVD2pXITrg1Ecc8MgG63h9dy4c6lDdY+oIxgqFzx2FfBggwke70r3UPh9KkG2pdIhrR+1HJkVuswQNpqCb2uI607l+2oJnVT8yMjwAwdflnXp6v8KVuunVdwgQjFxgMOv3QRLlvfk6Ka1q99LBpsy81vIgU0MLuav6lr4lTGDoOH7AVk3V0PhspZq+iVgqE9SpQksakEYDzsvDxOYxERMClPrIeyGVpP4KYhOmj0kOcn8vTbyajPim1w0W1vhDW8wAtTIa3VihmGem+x76SJYTfRTZgUQSmxilFMPFedCbfTELI0oVtFO/043LISyGGKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqShcPxVVgW3tHPjWYbXaSVFt/KFkCvYVl+psFGkEmI=;
 b=Jtm+OaOL80jq8pLcsEFCP9VAcuX9jwVuiwIJF0YqHdcpvzDTQAWkj+AEU2r8dqLk0QBYwcnfaTDQkwFrW75wbd5KkQfpd858AUBk4T9ozkH0BUHc9BQsntDWnSvTHSA3Ya/+DOoXQlc3dFBGx1xR5QqUFLabEzJKbK6h0QZLBgd5dFEeM3/xs/SP3UwgwwTwJIeayQPFfM5w9Nu6Yk34Nt7FHWmesmI4d4NwieVk9G2RfW4z/XqQC2IBFM6yZ1Guo3AvgA9JyzgyuyRr/Pk4hJ4mZDLoRZuihCYDElBZFRRLcvjlhRek1m5RLjA4l4nyxCI7X/twF5zMiswxmE9pXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqShcPxVVgW3tHPjWYbXaSVFt/KFkCvYVl+psFGkEmI=;
 b=EKtrEQRF8qlVFbL7iJVdf0RtZ5nKmnIPR/NQfSM0DFY/4CgMUzVHg6yFykn5spaKlssVi5PeNy3cFvZLnGLJZnHwdxuY2eg5YvusmKhaUYjbA0CirKajoWHAIqHNDbP6ainHY8k7FGxPavjPsC3EDUv4BjcN7p+5CmnFIhZt0/w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2698.namprd12.prod.outlook.com (20.176.118.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Mon, 18 Nov 2019 08:59:29 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843%5]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 08:59:29 +0000
To: Julia Lawall <julia.lawall@lip6.fr>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <alpine.DEB.2.21.1911171206540.2641@hadrien>
From: vishnu <vravulap@amd.com>
Message-ID: <a0436f74-4396-90e3-76fb-9b00abe4e925@amd.com>
Date: Mon, 18 Nov 2019 14:28:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <alpine.DEB.2.21.1911171206540.2641@hadrien>
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::30) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
MIME-Version: 1.0
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b873f87-24f1-428f-2221-08d76c059e50
X-MS-TrafficTypeDiagnostic: DM6PR12MB2698:|DM6PR12MB2698:
X-MS-Exchange-PUrlCount: 6
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB269823A7420C027770AE5EC0E74D0@DM6PR12MB2698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0225B0D5BC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(316002)(14444005)(47776003)(66946007)(6512007)(81166006)(6246003)(7736002)(478600001)(31696002)(8936002)(230700001)(6306002)(6486002)(3846002)(6116002)(2906002)(229853002)(4326008)(6666004)(52116002)(23676004)(2486003)(386003)(6506007)(53546011)(186003)(476003)(26005)(486006)(76176011)(446003)(11346002)(2616005)(36756003)(58126008)(65956001)(66066001)(65806001)(110136005)(7416002)(31686004)(54906003)(8676002)(6436002)(81156014)(4001150100001)(30864003)(14454004)(966005)(25786009)(5660300002)(305945005)(6636002)(66556008)(99286004)(66476007)(50466002)(43062003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2698;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:3; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIYNi5gU2QcjO9lxqRMn7WzJDs7vJIsKqu+aVtAGteYCVEZmA6DU7rDu9G6wIsdau12IUEflwvF70YJtokZj6r+nhP3Jxyp/xs7/qno3vR/EogpbmegfjZRld61ih40yAeiL9FwC99hnaMzsiTjx2Fe9ok7P50IDvWyi49bdf1uixIZ5lsu8vcQZ9kRV5WxZcRiINRF5VHpX0b6aObDBHy/TiPAAAnTUHzSUjG309+odebovLuZfwMR+A2wwjbmJKGTThQJepiTryB6pvChpVfVbEs0gTVWxqb+dsVV3dnGplMy9znOhOPn5V6m97nUDT3W4kSXLF+UHyaY561zlzFLADH9l6z/y+8JnrIy+6MELW+++wm0SiH/3Aa9xgbgwflBiiHoI/d0Yk31B2DPoDciYJhDAI6KQuVLkGiDd4Gjv8ODyEwbunQrbWmgfoIEezfyqk86jzTKaIXXEihW4hN7suoKCIX6J3noOBm9RA1Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b873f87-24f1-428f-2221-08d76c059e50
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 08:59:28.7330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFnK1+YHBORk8z3r9VNbz/QWvAAcZkR/J/76OlUpsEfR5f44qjJHv04WHXpXZew0JcFsG0MBiCQksPSHZq9FNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2698
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>, kbuild-all@lists.01.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sanju R Mehta <sanju.mehta@amd.com>, Mark Brown <broonie@kernel.org>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v5 6/6] ASoC: amd: Added ACP3x
 system resume and runtime pm (fwd)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 17/11/19 4:40 PM, Julia Lawall wrote:
> Line 179 needs to cleanup everything that needed to be cleaned up in the
> previous error handling code (line 173) as well as adding an iounmap.  But
> maybe you could have used a devm function to avoid the need for the
> iounmap.
> 
> Also functions should have blank lines between them.  That is why this
> report contains lots of function definitions, and not just the one with
> the problem.
> 
> julia


Hi Julia,

This is not latest version.I have already send V6 version.
The comment which you gave is for v5 old version.


Thanks,
Vishnu

> ---------- Forwarded message ----------
> Date: Sun, 17 Nov 2019 13:55:47 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@lists.01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: Re: [RESEND PATCH v5 6/6] ASoC: amd: Added ACP3x system resume and
>      runtime pm
> 
> CC: kbuild-all@lists.01.org
> In-Reply-To: <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
> References: <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
> CC:
> 
> Hi Ravulapati,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on asoc/for-next]
> [cannot apply to v5.4-rc7 next-20191115]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Ravulapati-Vishnu-vardhan-rao/ASoC-amd-Create-multiple-I2S-platform-device-Endpoint/20191113-230604
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> :::::: branch date: 4 days ago
> :::::: commit date: 4 days ago
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> 
>>> sound/soc/amd/raven/pci-acp3x.c:179:2-8: ERROR: missing iounmap; ioremap on line 170 and execution via conditional on line 178
> 
> # https://github.com/0day-ci/linux/commit/bfd341330019202bd0a17caa808937c88d536e58
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout bfd341330019202bd0a17caa808937c88d536e58
> vim +179 sound/soc/amd/raven/pci-acp3x.c
> 
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   24
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   25  static int acp3x_power_on(void __iomem *acp3x_base)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   26  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   27  	u32 val;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   28  	u32 timeout = 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   29  	int ret = 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   30
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   31  	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   32
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   33  	if (val == 0)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   34  		return val;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   35
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   36  	if (!((val & ACP_PGFSM_STATUS_MASK) ==
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   37  				ACP_POWER_ON_IN_PROGRESS))
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   38  		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   39  			acp3x_base + mmACP_PGFSM_CONTROL);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   40  	while (++timeout < DELAY) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   41  		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   42  		if (!val)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   43  			break;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   44  		udelay(1);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   45  		if (timeout > 500) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   46  			pr_err("ACP is Not Powered ON\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   47  			return -ETIMEDOUT;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   48  		}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   49  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   50  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   51  static int acp3x_power_off(void __iomem *acp3x_base)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   52  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   53  	u32 val;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   54  	u32 timeout = 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   55
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   56  	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   57  			acp3x_base + mmACP_PGFSM_CONTROL);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   58  	while (++timeout < DELAY) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   59  		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   60  		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   61  			return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   62  		udelay(1);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   63  		if (timeout > 500) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   64  			pr_err("ACP is Not Powered OFF\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   65  			return -ETIMEDOUT;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   66  		}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   67  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   68  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   69  static int acp3x_reset(void __iomem *acp3x_base)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   70  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   71  	u32 val, timeout;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   72
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   73  	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   74  	timeout = 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   75  	while (++timeout < DELAY) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   76  		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   77  		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   78  							timeout > 100) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   79  			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   80  				break;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   81  			return -ENODEV;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   82  		}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   83  		cpu_relax();
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   84  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   85  	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   86  	timeout = 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   87  	while (++timeout < DELAY) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   88  		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   89  		if (!val)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   90  			break;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   91  		if (timeout > 100)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   92  			return -ENODEV;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   93  		cpu_relax();
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   94  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   95  	return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   96  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   97  static int acp3x_init(void __iomem *acp3x_base)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   98  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13   99  	int ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  100
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  101  	/* power on */
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  102  	ret = acp3x_power_on(acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  103  	if (ret) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  104  		pr_err("ACP3x power on failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  105  		return ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  106  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  107  	/* Reset */
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  108  	ret = acp3x_reset(acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  109  	if (ret) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  110  		pr_err("ACP3x reset failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  111  		return ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  112  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  113  	return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  114  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  115  static int acp3x_deinit(void __iomem *acp3x_base)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  116  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  117  	int ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  118
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  119  	/* Reset */
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  120  	ret = acp3x_reset(acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  121  	if (ret) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  122  		pr_err("ACP3x reset failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  123  		return ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  124  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  125  	/* power off */
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  126  	ret = acp3x_power_off(acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  127  	if (ret) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  128  		pr_err("ACP3x power off failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  129  		return ret;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  130  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  131  	return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  132  }
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  133  static int snd_acp3x_probe(struct pci_dev *pci,
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  134  			   const struct pci_device_id *pci_id)
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  135  {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  136  	int ret;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  137  	u32 addr, val, i;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  138  	struct acp3x_dev_data *adata;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  139  	struct platform_device_info pdevinfo[ACP3x_DEVS];
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  140  	unsigned int irqflags;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  141
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  142  	if (pci_enable_device(pci)) {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  143  		dev_err(&pci->dev, "pci_enable_device failed\n");
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  144  		return -ENODEV;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  145  	}
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  146
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  147  	ret = pci_request_regions(pci, "AMD ACP3x audio");
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  148  	if (ret < 0) {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  149  		dev_err(&pci->dev, "pci_request_regions failed\n");
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  150  		goto disable_pci;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  151  	}
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  152
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  153  	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  154  			     GFP_KERNEL);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  155  	if (!adata) {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  156  		ret = -ENOMEM;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  157  		goto release_regions;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  158  	}
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  159
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  160  	/* check for msi interrupt support */
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  161  	ret = pci_enable_msi(pci);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  162  	if (ret)
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  163  		/* msi is not enabled */
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  164  		irqflags = IRQF_SHARED;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  165  	else
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  166  		/* msi is enabled */
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  167  		irqflags = 0;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  168
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  169  	addr = pci_resource_start(pci, 0);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12 @170  	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  171  	if (!adata->acp3x_base) {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  172  		ret = -ENOMEM;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  173  		goto release_regions;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  174  	}
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  175  	pci_set_master(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  176  	pci_set_drvdata(pci, adata);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  177  	ret = acp3x_init(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13 @178  	if (ret)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13 @179  		return -ENODEV;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  180
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  181
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  182  	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  183  	switch (val) {
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  184  	case I2S_MODE:
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  185  		adata->res = devm_kzalloc(&pci->dev,
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  186  					  sizeof(struct resource) * 4,
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  187  					  GFP_KERNEL);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  188  		if (!adata->res) {
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  189  			ret = -ENOMEM;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  190  			goto unmap_mmio;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  191  		}
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  192
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  193  		adata->res[0].name = "acp3x_i2s_iomem";
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  194  		adata->res[0].flags = IORESOURCE_MEM;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  195  		adata->res[0].start = addr;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  196  		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  197
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  198  		adata->res[1].name = "acp3x_i2s_sp";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  199  		adata->res[1].flags = IORESOURCE_MEM;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  200  		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  201  		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  202
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  203  		adata->res[2].name = "acp3x_i2s_bt";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  204  		adata->res[2].flags = IORESOURCE_MEM;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  205  		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  206  		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  207
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  208  		adata->res[3].name = "acp3x_i2s_irq";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  209  		adata->res[3].flags = IORESOURCE_IRQ;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  210  		adata->res[3].start = pci->irq;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  211  		adata->res[3].end = adata->res[3].start;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  212
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  213  		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  214
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  215  		memset(&pdevinfo, 0, sizeof(pdevinfo));
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  216  		pdevinfo[0].name = "acp3x_rv_i2s_dma";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  217  		pdevinfo[0].id = 0;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  218  		pdevinfo[0].parent = &pci->dev;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  219  		pdevinfo[0].num_res = 4;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  220  		pdevinfo[0].res = &adata->res[0];
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  221  		pdevinfo[0].data = &irqflags;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  222  		pdevinfo[0].size_data = sizeof(irqflags);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  223
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  224  		pdevinfo[1].name = "acp3x_i2s_playcap";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  225  		pdevinfo[1].id = 0;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  226  		pdevinfo[1].parent = &pci->dev;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  227  		pdevinfo[1].num_res = 1;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  228  		pdevinfo[1].res = &adata->res[1];
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  229
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  230  		pdevinfo[2].name = "acp3x_i2s_playcap";
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  231  		pdevinfo[2].id = 1;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  232  		pdevinfo[2].parent = &pci->dev;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  233  		pdevinfo[2].num_res = 1;
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  234  		pdevinfo[2].res = &adata->res[2];
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  235  		for (i = 0; i < ACP3x_DEVS ; i++) {
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  236  			adata->pdev[i] =
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  237  				platform_device_register_full(&pdevinfo[i]);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  238  			if (IS_ERR(adata->pdev[i])) {
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  239  				dev_err(&pci->dev, "cannot register %s device\n",
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  240  					pdevinfo[i].name);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  241  				ret = PTR_ERR(adata->pdev[i]);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  242  				goto unmap_mmio;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  243  			}
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  244  		}
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  245  		break;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  246  	default:
> 00347e4ea8ca4c Colin Ian King                2018-11-16  247  		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  248  		ret = -ENODEV;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  249  		goto unmap_mmio;
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  250  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  251  	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  252  	pm_runtime_use_autosuspend(&pci->dev);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  253  	pm_runtime_set_active(&pci->dev);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  254  	pm_runtime_put_noidle(&pci->dev);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  255  	pm_runtime_enable(&pci->dev);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  256  	return 0;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  257
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  258  unmap_mmio:
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  259  	ret = acp3x_deinit(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  260  	if (ret)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  261  		dev_err(&pci->dev, "ACP de-init failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  262  	else
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  263  		dev_info(&pci->dev, "ACP de-initialized\n");
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  264  	pci_disable_msi(pci);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  265  	for (i = 0 ; i < ACP3x_DEVS ; i++)
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  266  		platform_device_unregister(adata->pdev[i]);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  267  	kfree(adata->res);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  268  	iounmap(adata->acp3x_base);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  269  release_regions:
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  270  	pci_release_regions(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  271  disable_pci:
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  272  	pci_disable_device(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  273
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  274  	return ret;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  275  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  276  static int  snd_acp3x_suspend(struct device *dev)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  277  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  278  	int status;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  279  	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  280
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  281  	status = acp3x_deinit(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  282  	if (status)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  283  		dev_err(dev, "ACP de-init failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  284  	else
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  285  		dev_info(dev, "ACP de-initialized\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  286
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  287  	return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  288  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  289  static int  snd_acp3x_resume(struct device *dev)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  290  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  291  	int status;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  292  	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  293
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  294  	status = acp3x_init(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  295  	if (status) {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  296  		dev_err(dev, "ACP init failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  297  		return status;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  298  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  299  	return 0;
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  300  }
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  301  static const struct dev_pm_ops acp3x_pm = {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  302  	.runtime_suspend = snd_acp3x_suspend,
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  303  	.runtime_resume =  snd_acp3x_resume,
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  304  	.resume =       snd_acp3x_resume,
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  305  };
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  306  static void snd_acp3x_remove(struct pci_dev *pci)
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  307  {
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  308  	int i, ret;
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  309  	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  310
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  311  	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  312  		for (i = 0 ; i <  ACP3x_DEVS ; i++)
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  313  			platform_device_unregister(adata->pdev[i]);
> 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  314  	}
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  315  	ret = acp3x_deinit(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  316  	if (ret)
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  317  		dev_err(&pci->dev, "ACP de-init failed\n");
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  318  	else
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  319  		dev_info(&pci->dev, "ACP de-initialized\n");
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  320  	iounmap(adata->acp3x_base);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  321  	pm_runtime_disable(&pci->dev);
> bfd34133001920 Ravulapati Vishnu vardhan rao 2019-11-13  322  	pm_runtime_get_noresume(&pci->dev);
> 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  323  	pci_disable_msi(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  324  	pci_release_regions(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  325  	pci_disable_device(pci);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  326  }
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  327  static const struct pci_device_id snd_acp3x_ids[] = {
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  328  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x15e2),
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  329  	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  330  	.class_mask = 0xffffff },
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  331  	{ 0, },
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  332  };
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  333  MODULE_DEVICE_TABLE(pci, snd_acp3x_ids);
> e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  334
> 
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology Center
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
