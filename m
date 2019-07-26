Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43876014
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 09:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3151FF3;
	Fri, 26 Jul 2019 09:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3151FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564127345;
	bh=dvK/eM8wCk2kbUCLI7ViYrQ8jpK9mTMwbrVuBeguQnE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/Xh8F3tkBr1kfm5lSWWGjc9IftyubZKULI9ZR1yNRnyz+zBP7RdrUcniWikEtFTR
	 gwJGBhdCFm19KcXIuc/hrwxgToUlYGy7Df0C9OVNRV1sRgCYTo62DdSO+1GykBJY4y
	 B50hXEuuSeajwKuF5obyu5MujnS3WyvwhGoMcAX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A138FF801A4;
	Fri, 26 Jul 2019 09:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E9B3F801A4; Fri, 26 Jul 2019 09:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4BBDF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 09:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BBDF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="AG0vraQY"; 
 dkim=pass (1024-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="UHi9nNmp"
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6Q7fhrP024977; Fri, 26 Jul 2019 00:47:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=fBflJxH3/gTyfl7B9WE5r72IC0e6sz/olHfUw3rl3Ls=;
 b=AG0vraQYNp6sFMRXoLb1Ds/d17baNeuWMKiPAeCITsBpT8ssEF24qRCrbZLyXlQmh/Dd
 gM+gBNF60IczzfZVr8hySCkMAqdGbDHi+kN8rU4+Om1rVcly1viihfN4AGuF6phjILt/
 Pe1eeepcOuqyhLd6LdFROG7hL54iY8cAoFqZrXR5eHCboN7xBCGpZtmzdQidHccvLJbr
 1ARoGd97iJJL3CVRd8rNf9uoLibXBLYufOvvR4xkoj8KJa+pFOZOp3voCFsUeNZgg8YH
 wTSyvC8tiwcuqKRKRDjcffu5IOS7BK4Ks5Yi6rY+UZf/Tvp2WB6r58iiyYy4tSaINa87 UA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2ty9h4mgju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2019 00:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4aHyAJP4DcNvI6FRaJXEPelfV9N13FJoS/X6XvZeDrKpgw1Ny9exTXYb4Rn6i41dYSSB5XDdJXXQ/7/uTPzVjqOnssINAn3Y5z7drM89pc85U1HbVkpQryGZRY78NVHRLC+xCi0HeuzAj3RAxlyDBA0NHOdoQDJMcpmBtjTIkUpuIiODiS7CWgkgUaBPgXCmI88I6LSppQFegW5Hb+EALg9yjIY07p+tIC/sn/Nd+vLurIKr1sgmpCcVL57Fazc9qVve+VUB/GBNZHVT1JB+GC3OKX90ZHkTwSnZ4FU/wTTV/0+rWmu+OTRVzHWyAzchZZIw4DyGQzADsfRfHZSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBflJxH3/gTyfl7B9WE5r72IC0e6sz/olHfUw3rl3Ls=;
 b=b/o40nF3ug7A8SR+bnRzeLr+BnPOmj3tWgjVxX13ibiLTr9gYvigINtRd2nVHjVRzrbDHREF96GEGwkteQ0yuQ786o5J1EGViZmvECDIatqFZaA71sDjtppADV0auxozywcijwT7aN71bxP8HfahdCDmXi4gU9UPiT3+MFYCHq3/WP7jqGLkXt70JOFlyGMZnQr5avE/Vwc1tRqhFHXhVlGMZ53SqWyJujSpPN6jCi8/0sqmLF11ltE3z+YhNNRJVzNnsRd7BR3jY//1+wuMJt0//xw9mTbPQbNrEttxg5npfOYqVGS7UR/Stj7+B5BUwz+4AbWXI7r5Mtd5MpFDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cadence.com;dmarc=pass action=none
 header.from=cadence.com;dkim=pass header.d=cadence.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBflJxH3/gTyfl7B9WE5r72IC0e6sz/olHfUw3rl3Ls=;
 b=UHi9nNmpu6vRXJl2nH4illo+BjrT+vehNq+AIGihrRC1q3cA5hctXjV11utk7TJbVwM66gA5bK18f/PvXIiGQkOd6vrNtQHIxIOiMlBVX0D9ji2mdcvbYVfhFLTAf8hdd1O8HphwZk5Gy4yJYlZtCY4IE0Qq5gh8ANLTi0GOMMY=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2730.namprd07.prod.outlook.com (10.166.207.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 07:47:04 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763%6]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 07:47:04 +0000
From: Jan Kotas <jank@cadence.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Thread-Topic: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
Thread-Index: AQHVQ0J6QtaVaTjiSkWdh9su5zQPs6bchAIAgAACGYA=
Date: Fri, 26 Jul 2019 07:47:04 +0000
Message-ID: <716D5D19-D494-4F4E-9180-24CB5A575648@global.cadence.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <20190726073931.GE16003@ubuntu>
In-Reply-To: <20190726073931.GE16003@ubuntu>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7aa011e-80ef-47da-c8fa-08d7119d73e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY1PR07MB2730; 
x-ms-traffictypediagnostic: CY1PR07MB2730:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY1PR07MB27305610C44D23504FA7DF69D0C00@CY1PR07MB2730.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(36092001)(199004)(189003)(26005)(53546011)(6506007)(6916009)(81166006)(256004)(33656002)(6246003)(2906002)(76176011)(6512007)(54906003)(99286004)(316002)(8676002)(486006)(14454004)(186003)(229853002)(966005)(8936002)(66946007)(102836004)(6116002)(5660300002)(91956017)(4326008)(25786009)(6436002)(446003)(64756008)(81156014)(66446008)(86362001)(66556008)(66066001)(305945005)(6306002)(7416002)(476003)(76116006)(71200400001)(71190400001)(6486002)(7736002)(3846002)(11346002)(68736007)(478600001)(66476007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2730;
 H:CY1PR07MB2521.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bi+DI7PsXE7hYGNpPYAPtP6fXjULIvEFtA1ruvmM/QOANubQtt4Uy7OoFfw0dR6sgJnQe2smCkLMjB9xuPxWj3X1Q0i+3Zps2SQWMjjPXtuDd7sgp2wTlWEHHg0lk4VtPAFl7WaiHE0vuxPkUVZsLb+Abdk8grQX3qa2F/cE25dFt9c9tAKazgI6MNy7llvUnSUfnquOb8c6nGyIl4EOzuxgSbzByfR97WiasR0Xh8tQHr+VYZUhA+5EcbaxbhvP5f7owsx/EpBLLrL1c4dE245079BWOuVnuLfSSSz8uwMTyYOQDREA3esh7aDtXIqrI4qxwIxzgdIfJT8Cb2QGUy7PhJTyXZthJ/xcqYJuLgXPRHG91XxYvOcb35HMSNoQnPVk1NUJLgsi9wBfziCUXO5JrI1GR0dNH7AvTtXzI2A=
Content-ID: <D6BB97446A953042B06235D0B640B2C9@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aa011e-80ef-47da-c8fa-08d7119d73e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 07:47:04.7462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jank@global.cadence.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2730
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260101
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jan Kotas <jank@cadence.com>,
 "slawomir.blauciak@intel.com" <slawomir.blauciak@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I while back I proposed a patch for this, but it went nowhere.

https://patchwork.kernel.org/patch/10887405/
Maybe something similar can be implemented?

Jan

> On 26 Jul 2019, at 09:39, Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com> wrote:
> 
> EXTERNAL MAIL
> 
> 
> Hi Pierre,
> 
> I might be wrong but this doesn't seem right to me. (Supposedly) all RT-PM
> functions check for "enabled" internally. The only thing that can happen is
> that if RT-PM isn't enabled some of those functions will return an error.
> So, in those cases where the return value of RT-PM functions isn't checked,
> I don't think you need to do anything. Where it is checked maybe do
> 
> +	if (ret < 0 && pm_runtime_enabled(slave->bus->dev))
> 
> Thanks
> Guennadi
> 
> On Thu, Jul 25, 2019 at 06:40:09PM -0500, Pierre-Louis Bossart wrote:
>> Not all platforms support runtime_pm for now, let's use runtime_pm
>> only when enabled.
>> 
>> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> drivers/soundwire/bus.c | 25 ++++++++++++++++---------
>> 1 file changed, 16 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index 5ad4109dc72f..0a45dc5713df 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -332,12 +332,16 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>> 	if (ret < 0)
>> 		return ret;
>> 
>> -	ret = pm_runtime_get_sync(slave->bus->dev);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (pm_runtime_enabled(slave->bus->dev)) {
>> +		ret = pm_runtime_get_sync(slave->bus->dev);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> 
>> 	ret = sdw_transfer(slave->bus, &msg);
>> -	pm_runtime_put(slave->bus->dev);
>> +
>> +	if (pm_runtime_enabled(slave->bus->dev))
>> +		pm_runtime_put(slave->bus->dev);
>> 
>> 	return ret;
>> }
>> @@ -359,13 +363,16 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>> 			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
>> 	if (ret < 0)
>> 		return ret;
>> -
>> -	ret = pm_runtime_get_sync(slave->bus->dev);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (pm_runtime_enabled(slave->bus->dev)) {
>> +		ret = pm_runtime_get_sync(slave->bus->dev);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> 
>> 	ret = sdw_transfer(slave->bus, &msg);
>> -	pm_runtime_put(slave->bus->dev);
>> +
>> +	if (pm_runtime_enabled(slave->bus->dev))
>> +		pm_runtime_put(slave->bus->dev);
>> 
>> 	return ret;
>> }
>> -- 
>> 2.20.1
>> 
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__mailman.alsa-2Dproject.org_mailman_listinfo_alsa-2Ddevel&d=DwIBAg&c=aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-_haXqY&r=g7GAQENVXx_RQdyXHInPMg&m=vETGQLSPeGb7K_ZsXv4Tl3VFfdXzyummTDga97ozJcg&s=LiW4SToh5U0zhnkox54oRhJ1u3vFNbBB9nmzRDuCDjI&e=

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
