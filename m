Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387656A761
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 18:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59A5166D;
	Thu,  7 Jul 2022 18:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59A5166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657210001;
	bh=ydnhtaXvqIGTbF+6DRu+n/R7u69uICAweXknbYp9XAs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYFGm/pya4fPTBfSOlV+Qj6OKgGeq4Dpe8biEvyaAhguLQLvHaFK1zfkEcxCpzTZw
	 tm7mgx1opBNmjH0lHZZNGkwIIdTz84pzflOgU7FWIc+hy/jaugjAkIq7EFt0w/HN6G
	 w7wET46tXUd9bYUJlUgKk3imAeeBDJaDxwk9QTjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20049F804F1;
	Thu,  7 Jul 2022 18:05:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6519F8028D; Thu,  7 Jul 2022 18:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC4E7F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 18:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4E7F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="kycrIupe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBSZibm5+mvBiFAXUqF/qNLcMTvEYIItalVyN+zPHxYJ5Y2R1vA4Tsu35jSzq1F/AmN6czts8DLhlG4b0mTWXhVx/Zf/UkkLcQda/fa0QqC69csw8YyUKZlDZEd4bEM1SvKJ4gW33stMqEE6yfmEX0mgu+HHKajJZbMcW/o/ZDcpkOCMy5OgzjCTpwutBce1+iLeanLBFV91u9vMLMzyCdY3pxYf1vYSL2MwFvl7HZ258J2Z3sNbLGkWp9PHwiVGFp926hCJnyUleNlREdZfyZ9oQ3tWdFMNjDnnrbbtxRVw/jKODXp1IhL/fW1Oe+maXroAMavjxvPf8F2wa5toDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4evU0ogssq2KFcBxHGA/ASw+kuHbTLwg51gJuhkp9Y=;
 b=mU8l/3CzK7BQP3HPc4PdaW2vROppSUuLxxs8v/+TRGl96FYA6merRIDhNlpyf+x2KCp7ds5CulDX3nykZpOriLyTIAa4deTPmWDngQbLWcXPgVTBPHL5/lr2wPPolBF02tEJQbBbShwV0qB71YhUn3piRh/fg6M1JdZPyBJ8F1jfsYmrU8arm8AqpJ0jNDAegQQMGByr/8Tm7I7TmRNAA2b9I1cy2G6ktY7cal6ZiPC0QT7mTUyr44FpBb8WS3NPvA7PsTjX5u214DNQugJuezdn1HfJ6R4Z+6QOPu+ZW4NVukQywToxV1FCGkbDq3Dpdp9wzwwXmi2VQhhxKfry9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4evU0ogssq2KFcBxHGA/ASw+kuHbTLwg51gJuhkp9Y=;
 b=kycrIupeRKhbs1cMXhg/UqmfMz5rpObrpuTAR+mWtcBWTgWZ1XwGejxX4e71EMuTOCPGONVGxly7NlQy/lNllx0s7+0N7G9LKsNX6DvhBqqFWBDHSM2uoPZWZ0fQ/oIqmIQpoO9gYJ76xSxWqtJ5erVoZjKWl/w5NrrY+MBEXpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18)
 by PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 16:05:25 +0000
Received: from DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e127:3aff:e853:414d]) by DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e127:3aff:e853:414d%3]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 16:05:24 +0000
Subject: Re: [PATCH 3/3] ASoC: amd: acp: Add legacy audio driver support for
 Rembrandt platform
To: kernel test robot <lkp@intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220624194821.287462-4-Vsujithkumar.Reddy@amd.com>
 <202206250650.DKkqPR4A-lkp@intel.com>
From: "Reddy, V sujith kumar" <vsujithkumar.reddy@amd.com>
Message-ID: <e468ad64-468d-20df-70cd-ccf6148fe557@amd.com>
Date: Thu, 7 Jul 2022 21:35:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <202206250650.DKkqPR4A-lkp@intel.com>
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To DM6PR12MB4171.namprd12.prod.outlook.com
 (2603:10b6:5:21f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914bbcc6-5f37-4b64-2245-08da60328066
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01yRCostOVnFiR2M5EX2NKRsR4OXDpKXqK0DrVEiQH1jrJVGv/9UXm/6HzYJv40ch095MC508ISjYGzB+N+H4hGOZwqlO7CGQrPFcDfKugUFnnX/9GuPh/FKwb2h3LpCZb4OJ6J7n4c5s7VLqlc8yOCEASlzGPcWt49lpAdUo4ePI4LIY07q3Np+nN/+3cQ3wkFDQXCGJ5PTRYqEAF/x2ZoAoYXml1sEa5ZdMvWRnO0tC7vi6P+ENeZoXHqu8FdQf4ikd9e/9x7jTeEV7CiSbV25JjiYyy/Tt26NCO1vRd7iaEioU8kLoNV8i8CLL/8aZE2Xv8dN7RIB9SFC0FGk4WECW9jL9lh4iPlr7Xu9qnieLuLXG+wgnp3JeW4luOJQ9BqH6Dy7FgtKxziqg5KvYzIgdzHeWUIhunov7YGJlKXwVoCp/sBOBOMFM5Y6zmwh0HZ9KGLrYX9YBqNU5fve5JttYyUQlzsgsLRza9+OO4lIQvhv2ENcM65ALZvzC158SDAVzo/u2Nyk+ftItghGGoOqkqF14D4nmGwhYaORZ1VEwvxIFrhbtkoshor6S6696fDU4BvHKrWSwKKuJgDIuUL6Lmn7Cpf76eykIhsUFZXLcAa+ZjeRZSJFgzX94yFQ1dyIaT9ivq6AqwSLGR7e40wLRDQcGowEX7M6/OHgjmjfecAZ0JjWw5jr21VRkOrZwMPj0nJyK77GbidllpA5tkwLKyKESJV2l+EDlIGNtrGvjqQcv+2M+q6SG9PbckTi7PvP02DnKU9GmMM8gPlvYYHIT0dtIHMmP898DRCcFRqhC8UY+Kdsj9C/nBc3Hx3jCN2OEQfB4ffbOWFErdXFPaC3j3AkGVUSkQxxDuiHiKdokNVTEnITOSmyzEQTgRbO3gcUQRW685VqvJb1mi80mZ3RNrNGJ7OunjfjNUgQYK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4171.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(41300700001)(7416002)(478600001)(6666004)(5660300002)(31696002)(45080400002)(6486002)(8936002)(30864003)(316002)(86362001)(966005)(2906002)(54906003)(38100700002)(66946007)(166002)(31686004)(186003)(66556008)(8676002)(66476007)(2616005)(36756003)(26005)(83380400001)(4326008)(6506007)(6512007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?vV66q+7gXOS1hqOu4S9DsgCKaTMFJKKRmejewolLPVRRLSctpiwampmA?=
 =?Windows-1252?Q?HjiWpsCP1km8L+fnPccHOOLPRquqMVSV8cQqJHjpgD1M3mmAHWmVqbaY?=
 =?Windows-1252?Q?j8siJEnDhTF9v9wYgX+T/B8uNMUpqm48bEe3ntYVPcAPf5g8bD6nl1LU?=
 =?Windows-1252?Q?Qm0OADZ0q7bbEacnmcS1H4oFG0GicdFrNnPq9t7oSm8pT2i7tSMXztSW?=
 =?Windows-1252?Q?3niSeu2yGHk6ekH0K4bHq8jYuCACcZMFntmqpUwdek+a3cwqhjwBT7Zh?=
 =?Windows-1252?Q?wIbLcPmiwDG3KD6OI+/J8NawKePX26KLyaZ96+O0e7Tal8BOY9X+4QzV?=
 =?Windows-1252?Q?43eTC9lzdz5nxBMr2Y9gsMaR5YOFF09HrvjQ3Ypeovlv1UGjdNjgaXiG?=
 =?Windows-1252?Q?rhBfr2GQbXrVVoAQLXAhVkGeWF5cUIWnk/A2MWh/C8wc5tMYL4ot6iJl?=
 =?Windows-1252?Q?Ou0erPkzRwNcoHvD9rvOJ5nCFEp7mzqvT/Yr2yyz4+CovwDq9IG6HfCy?=
 =?Windows-1252?Q?Pz2He1d0nNenVuSFA/dj/Xc0R5g0+wJtL1d+wLoCe7YqinreFXQbGdQz?=
 =?Windows-1252?Q?1GRrtBwYcJb/lcYBbjOUDFTLYmyqiE5J98H4i2qxDC4U6w8n53l9UqGa?=
 =?Windows-1252?Q?Fgvvh5XTkqN5KjkZdZjS8eHqWJ74+OwukFWy2X3W36p28WGQa5vYv+yD?=
 =?Windows-1252?Q?RBDbyRNfk0uaH7b6x7elNotU4tJ6qCO/r2WJdSa1chAxFd8lPCFBLNiu?=
 =?Windows-1252?Q?dITVb97OYOIoZ/dRU8c04OUcrm78F08FTUUhh1jdsQfxgJDBHRGe6fYi?=
 =?Windows-1252?Q?H+nlFNqfL73KnUwsBYKwofSfK6bskiU174sDh+QgFClmXYJSScEpBJIw?=
 =?Windows-1252?Q?39oqb2QIvwIuuBWMDoC6YIcV+PIroP/RfcCFow8EhoA1pK9bxcIFKAJF?=
 =?Windows-1252?Q?J78/vlQ5PkTpMSmZ9zbOfN+yXgDqPK1QYRdDUmUf0P+Tdf8oUHH++Kwg?=
 =?Windows-1252?Q?5oPOPYPMiEkvvS2osuAvL1iUKCJuYpptysy8TG4kzke4ONjgdTdRT9Hi?=
 =?Windows-1252?Q?CDwi2JrXacIMMqSAYC+O6XQkJvj7IW5TUyzh4l4aWEmQJLpBPrvf9AWg?=
 =?Windows-1252?Q?uUNfGbjH9K7qwfyATcdhLYMK4H/DlQRB7FIBhXpxNMaQ2h+s+0W8L14/?=
 =?Windows-1252?Q?PDsdObW9eHjDevdyWcZkYO8DeBF94Uj0yrsSoXiyI7OZcfxI0M/+imej?=
 =?Windows-1252?Q?cUNV9rGeYawIOer2+bnqpDV7ymksDOzg2lMK9KEMacTuoMbQOZhLDQcE?=
 =?Windows-1252?Q?wuwiOtB3MAavUYiEYQykGQ5zZlwqV7vpJs1VkPjiuwwg7eBpyNfNjJuQ?=
 =?Windows-1252?Q?0hRPHGdgNwl/CaC1UIYdUrgWSzTG6fBt3+n+ADIUZXNKmdhGpDenieMg?=
 =?Windows-1252?Q?NMlglFIA6Doe3iVtsSOI/BaukflOhGuKY0wWRQyv4bg/MowKAG+Gybjk?=
 =?Windows-1252?Q?8lUI7vhiO2DS582w30pcdPXC3z43cf11O1goH0N55GLyUgwT20kQJa7x?=
 =?Windows-1252?Q?2p8MLg1sGEYJ3QU7+NLovdoEWIhPeWplZ5bOqP9qOT8wQWJibR3rXI16?=
 =?Windows-1252?Q?UeQLoUdVCw9XBA/IcOQTH/nss5ynStms8v0XMKEA1XFOaIZCvjV9jTF6?=
 =?Windows-1252?Q?Bb9nPMW3m1CJTp1LzQ4XNy5aAY89soAT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914bbcc6-5f37-4b64-2245-08da60328066
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:05:24.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAR/U0GmKloUQtfy9zL4Tif/4BjO9dBnNBSy+aG62nxqtu/mjKrG+KdpZ6g6PHJE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Sunil-kumar.Dommati@amd.com, kbuild-all@lists.01.org,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, venkataprasad.potturu@amd.com,
 Meng Tang <tangmeng@uniontech.com>, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Syed Saba kareem <ssabakar@amd.com>, Dan Carpenter <error27@gmail.com>
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


On 6/25/2022 8:29 AM, kernel test robot wrote:
> [CAUTION: External Email]
>
> Hi sujith,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on next-20220624]
> [cannot apply to linus/master v5.19-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dMgKJPdC1Wozc8Fyvb%2BCGvAkKb4dxwlC%2BcEIsLTUwd0%3D&amp;reserved=0]
>
> url:https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FV-sujith-kumar-Reddy%2FADD-legacy-audio-driver-support-for-rembrandt%2F20220625-035009&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=hzTz9xhAhBAJ9usYOfc1IN0cmHiHREgtttyvUlDOoJs%3D&amp;reserved=0
> base:https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=awvLx0T4gFToItcVHMNqkUZ%2FaS120MOg15Jr1PGsumA%3D&amp;reserved=0  for-next
> config: i386-allyesconfig
> compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
> reproduce (this is a W=1 build):
>          #https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommit%2F32f53f63fb2ba0bbf7e8e145879a7340f28ebfbd&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4t5GdErDyUSzvhP1uW8KdxwCoE6MUPS1mjsg7HjDbYo%3D&amp;reserved=0
>          git remote add linux-reviewhttps://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=UjYTqFiuuaxQkLTThINcEzgzwCB%2Fl87%2B%2FYIiHGfCIl0%3D&amp;reserved=0
>          git fetch --no-tags linux-review V-sujith-kumar-Reddy/ADD-legacy-audio-driver-support-for-rembrandt/20220625-035009
>          git checkout 32f53f63fb2ba0bbf7e8e145879a7340f28ebfbd
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/amd/acp/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot<lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> sound/soc/amd/acp/acp-rembrandt.c:264:5: warning: no previous prototype for 'rmb_acp_init' [-Wmissing-prototypes]
>       264 | int rmb_acp_init(void __iomem *base)
>           |     ^~~~~~~~~~~~


Done

>>> sound/soc/amd/acp/acp-rembrandt.c:286:5: warning: no previous prototype for 'rmb_acp_deinit' [-Wmissing-prototypes]
>       286 | int rmb_acp_deinit(void __iomem *base)
>           |     ^~~~~~~~~~~~~~
>
Done
> vim +/rmb_acp_init +264 sound/soc/amd/acp/acp-rembrandt.c
>
>     263
>   > 264  int rmb_acp_init(void __iomem *base)
>     265  {
>     266          int ret;
>     267
>     268          /* power on */
>     269          ret = acp6x_power_on(base);
>     270          if (ret) {
>     271                  pr_err("ACP power on failed\n");
>     272                  return ret;
>     273          }
>     274          writel(0x01, base + ACP_CONTROL);
>     275
>     276          /* Reset */
>     277          ret = acp6x_reset(base);
>     278          if (ret) {
>     279                  pr_err("ACP reset failed\n");
>     280                  return ret;
>     281          }
>     282
>     283          return 0;
>     284  }
>     285
>   > 286  int rmb_acp_deinit(void __iomem *base)
>     287  {
>     288          int ret = 0;
>     289
>     290          /* Reset */
>     291          ret = acp6x_reset(base);
>     292          if (ret) {
>     293                  pr_err("ACP reset failed\n");
>     294                  return ret;
>     295          }
>     296
>     297          writel(0x00, base + ACP_CONTROL);
>     298
>     299          /* power off */
>     300          ret = acp6x_power_off(base);
>     301          if (ret) {
>     302                  pr_err("ACP power off failed\n");
>     303                  return ret;
>     304          }
>     305
>     306          return 0;
>     307  }
>     308
>
> --
> 0-DAY CI Kernel Test Service
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F01.org%2Flkp&amp;data=05%7C01%7CVsujithkumar.Reddy%40amd.com%7C76b71f6bc0b64a93432508da5656c7e4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637917228020649435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=H4qJDbhtyu9BGhMCtQvEe%2FvVZiueS2j%2F%2Fda%2BpwUOuLo%3D&amp;reserved=0
