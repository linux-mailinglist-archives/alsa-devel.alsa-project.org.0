Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508D412EB0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 08:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70F51669;
	Tue, 21 Sep 2021 08:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70F51669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632206343;
	bh=0IoYNxUxM/D+ePFUkrP7XgpiRHF1UgJPnvEgR1G9hlc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjy4WoEWaMMOw4odIxJjz6GaAFXy+jhNKnw1CXfeoF26l4dvSSyJHuF2PcG8eINAq
	 Va+2/bSxHCe7ISBxcGqu1mo8E23RJvZ0ExHJZDzOK9fHTwaHeLvZIJC0jnfSfGYcNN
	 0HlJZYapjQ/RUAVg0UYfbdVNOwi5ltrc3YU0rXoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D18F80124;
	Tue, 21 Sep 2021 08:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BB9BF80268; Tue, 21 Sep 2021 08:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40137.outbound.protection.outlook.com [40.107.4.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB88F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 08:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB88F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="V/Xlz0PS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFvS1bbkE+j40Y0OnGjclhpanWODXm2qBlGJqOyFXhKre+dAXoROx9nSdSzhyHYv/cpAvZy4Dmo+Gl8z9vPy4B6nV2k/nt36fakNs6aCdGuC4QvIknuXEkpke+733NQFDOEroCur2O17t9d8id5MGkwjVc0UDMPiTgUfXSfYuDdjw44f+ZpfdEEcecWdm16b/gVIqsxwFkOpcHWM21JRWINDISNvGJqV+P2MAdgXNakyFIL9kmR6KW8iVxb6TLPceXBctTDNDOP84dzY51o4QLchzLY/QQbzPDkk0v1yBUISTmfSFdqfQjNvQWW7L0dQiJVYL31p5s9ri34ovcw5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KlC6Ynt+PEaATBwFS9LUNt1G0ANEwRWBWxWOcCCxZsM=;
 b=UmZzxG+Xg8MdFHOw1T/AQ5WNgqS/OfEk7t42/cYifxwtKH/yzdsf8b6ogJpXi+IrAHLGMxKYW8E7aVoYSh4LDqaps+NRJAS+1OzcBgXewHqQWgpLkYGDwKDik5KfVk2o0o33elZYh8oiiw4nFWAAh3f7TjLCQJGHUMZXu5sz02mEbtkWNgKaQiVMcwE5fewqGhe2ySPzWbTl0O09ZJlixX+r51CeDTiNvycMCsJtQ6gunRArZ8lvq9fOVAL3j6wRdHSMYdifSBgaqPNkJptqbCP9/NCNuFqlo+llWhNZlhaKAxn0XNJpPpHZgs8dxobTWKcSMs1GmTvHhMt7uKYrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlC6Ynt+PEaATBwFS9LUNt1G0ANEwRWBWxWOcCCxZsM=;
 b=V/Xlz0PSSXiz9IzMw++29BDMdzqmg7wXW7opQJJ2taiq4Crb5//9ZdEPtilDg34K/6cokZ+odiV5mHTmNn829ZyaP0LLS6DXPZuNRhuTmPqp/uzO63u1GPrz+RgJZhUGowR2F+M0zLtKt/yPhyOwcK9J2kfYEWDNzKbmhBLvdjc=
Authentication-Results: birdec.com; dkim=none (message not signed)
 header.d=none;birdec.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0202MB2726.eurprd02.prod.outlook.com (2603:10a6:4:a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 06:37:33 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::35c9:1008:f5af:55a%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 06:37:33 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
To: Mark Brown <broonie@kernel.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <YUj9LqNTH6A4CQcj@sirena.org.uk>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <8ee31fd2-3fbe-f5da-a030-c6b677c7f398@axentia.se>
Date: Tue, 21 Sep 2021 08:37:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YUj9LqNTH6A4CQcj@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0363.eurprd05.prod.outlook.com
 (2603:10a6:7:94::22) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (185.178.140.238) by
 HE1PR05CA0363.eurprd05.prod.outlook.com (2603:10a6:7:94::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 06:37:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac9499da-2256-4434-d817-08d97cca4ada
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2726:
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2726EF80100EC00D7D724B58BCA19@DB6PR0202MB2726.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5MN//5W9ypsa9bmlb222JxP/MHx3V1V+Jt9gIjLj4FvILsR01XvVjrAWTqnw845XkhrbGNAh8I4Z/Rd08HKN2NlkBaryGkq6gqSJmOtLvk8a5kHbc1PMgxkRn0uPumejWgMiTVRmvQgYxYEKVZ7XZ3qQc4F+Xguhn85EZEfnww7L6bUuMwfRmSDfWceG94mervuDWPSbkn89B3zmE3WpqmP7uqvvrCdsXlovrPdPzuNMWgeWYTZiBGjRjTe2yQLwZRMi1593dGSZdBkOipv79RcWJ/LbdWKmFAgZ6rplJvMvawglz1yNyEPge4yaR2NWs6z7Wp5VjVubfkmLPBxivSapNQx0R0gDXPzHNzZEQsqoyErgH1sXmbMLyFrWQSMg8D72PnNYS7TtENUPRxMy5By9P6jBMV9Z0UdDz6IJ8gGUdZRp9nwK0CD/ocT3T0gBQklkb1JWLBXFMlz9aeLJBOA/kVGBkiZ4X6D03kKoyPv7kId4itc/ETvmdSQWO+NXbiXm/s+u5dc4e2RamK8AyWmRBTANNWeHEzwk6YPYawi/vbFzKS2gE5UgzvqNFWaWdkCsd840EBrzLWd5c2LE1esDp0uiBiuUPcmp1MEFhfnMkArNT7dQ/XpgJf/94HA4meqCNqPKhXO1u4mJmxk7iWVm2dMeqwPT5vG4+jRZLiSYWPZLuWoUJGbZ0GRLbJ33kfnp7xcyInM+RPtnpW67kQXtALGzvsBa5FbMKH0yCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(16576012)(31696002)(316002)(5660300002)(186003)(31686004)(26005)(83380400001)(8936002)(4326008)(6486002)(54906003)(2906002)(38100700002)(36756003)(8676002)(2616005)(956004)(53546011)(66476007)(66556008)(86362001)(66946007)(6916009)(508600001)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?SdMjJOJSOFjiDvUMGKfa3bo+KVVgjGXh2L1FAVImNxH4bg166wcHUfnk?=
 =?Windows-1252?Q?cfqGQRlWt1QhAsfCM3a2VGs50udoq9eUznp6dRKI9LjJD8RyuDjcNob9?=
 =?Windows-1252?Q?Do+mzjuaqGN+25ucq5buHFS7M6y/E3h+mXZacA2aOChIRosaEMv5PVx5?=
 =?Windows-1252?Q?GElZTAKTdLzYTw7x5OmxrFDH77F3AlboqMg2oWiIWTsiZnaS1crqfH3/?=
 =?Windows-1252?Q?c8E1cnhKA3oWhbDCh1ugmWJS/T2v+AUSTFbTIVLqXCicI4j/VCrFAndO?=
 =?Windows-1252?Q?TK51RkszRb65b4HNT9XLHWwUnbLLgDjE0IjnZXhq+BpN9jvWo9V0a6ol?=
 =?Windows-1252?Q?t3bQPDdNR5+0PEBA2pB/v2csyNt3t3VXk8/hW1jz/FLY/i/l9DTEpcSY?=
 =?Windows-1252?Q?IFOLorPam8ua3IPrPxlcddl/jKl+e+tQa1e05F5Ouu4NTgznmkytH8Zk?=
 =?Windows-1252?Q?uNRUziIy937WBk+vw+qxaWTpKmnYTWiCE3p+p7PnxaV6X9xPo7zuwjXL?=
 =?Windows-1252?Q?d++2GaXAK9A3vK+rZnmpLonnPLdo2SXybtYaXL6f4NaNEdvXoSGyGoXi?=
 =?Windows-1252?Q?LuXTBVBdjLC41bmFl8bNBi10VsoUFuPzIL2gw4sux/XPT6qk7hUVg6BI?=
 =?Windows-1252?Q?BVoSH+yJbWwPCBxklhpW6WB++oITzpIb84paBX935FGUM9O6IFtoWqNT?=
 =?Windows-1252?Q?Vu8K8Io9fhYj/Arn7SXiFuupLyzS6GgIGnTY606I7qcNUUABQbgYWM+Y?=
 =?Windows-1252?Q?xIvfbst9XXZ10EfK2m0LMo39Dvr0khvXy2wILRpXaUYBtOMKkwmtaLFE?=
 =?Windows-1252?Q?znjhlx9f+mi/nylxs7HqaMb5i4RsNrlrhtV+X4N9dgHmVZaXWHqSe4jO?=
 =?Windows-1252?Q?VBBTqT3R8MoUmen0qAx3wzO7eNL/DZEz1bOMz0NBTvCPKBHpDv4BLjmH?=
 =?Windows-1252?Q?SujhhMgEHZIlO0Dpjm0XgzVC3gBcXd0QVTChVwGHfz7+V19wQnT2lFBo?=
 =?Windows-1252?Q?l6C5yqeBlZYrRN5m3htOEp+iDy1lgRLcRJ4j3WLqQlRnlhOTFz2wrbq1?=
 =?Windows-1252?Q?TSFBHk/FL2QjtVenjnT51vhXakOiYNmSHBHkcTVl8iWrCRMx/Z95wQtv?=
 =?Windows-1252?Q?HW92BXi+YdyZPFPSV/OXL7/kmoN+XJTsIVWwjBXiHdOu1rq4o6NPP65J?=
 =?Windows-1252?Q?mb9d/wPT5Gq9jP97twDqXZcPtFxPbs8dEU+UCaDhb5MHbYxS0GzxVgIq?=
 =?Windows-1252?Q?bdsldUKyZvQXZhGcDl8X2j5BIZj+9Z8Ca0I5YbOCPtlggiZuy5ZHX5GV?=
 =?Windows-1252?Q?WBC2kwPlgyg08GFyJQPs5MervzDQgmjSDvtpwb2jh4YjvCFg2QrgQ1Yf?=
 =?Windows-1252?Q?qBhWMs5FhifzDd5eAIEoQ/hzBcZ+Xe10jJMCk1I+7IbHsW8MPVRf3GZF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9499da-2256-4434-d817-08d97cca4ada
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 06:37:33.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Yp470DJQhIOXYBMb/tJafJ+2RpSIT+QlmYfrFwXap1auxcM6gth9r1NYSSTYl3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2726
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
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

On 2021-09-20 23:29, Mark Brown wrote:
> On Mon, Sep 20, 2021 at 09:37:37PM +0200, Peter Rosin wrote:
> 
>> compare if the update was needed at all. But marking volatile wasn't
>> enough. I also tried to set both a default and mark as volatile,
>> but it seems every read fails with -16 (EBUSY). I don't get why, to me
>> it almost feels like a regmap issue of some sort (probably the regmap
>> config is bad in some way), but I'm not fluent in regmap...
> 
> Having a default for a volatile register isn't really a sensible
> configuration since the whole point with volatile registers is
> that they change underneath us, I'd not be surprised if we had
> some error checking code in there that was trying to tell you
> there was a problem though it does seem like it should at least
> be more verbose about it since returning -EBUSY isn't exactly
> helpful by itself.

I totally agree that it's not a sensible config to set up a register
with a default when it's marked as volatile. That was just a wild
attempt.

I expected it to just work to mark the register as readable and do
without the default value (i.e. the way it was before my patch). What
I don't understand is why regmap returns -EBUSY in that case. That
doesn't make sense to me. Perhaps that -EBUSY is propagated from the
I2C layer, but in that case, why is it then ok to do a write to
another register at the same spot in the code? So, why -EBUSY?

Something is going on that is not understood. At least not by me.

Cheers,
Peter
