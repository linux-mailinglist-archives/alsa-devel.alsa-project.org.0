Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DBD63F207
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:50:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95CF1744;
	Thu,  1 Dec 2022 14:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95CF1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902644;
	bh=mt3k7IMYcE6yOCs/ABSMLT2W0ibGcmIxMd0kGjrjCTY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3cLbeuC7KhSmbY2++JPZr58wRUXPGmmcEr68kp0xxn1VzB0atbUQc4XsP71TcOKc
	 Zq7WnnGdKK43mnPlc7R9YmPEw3qUMo2zFIh85zTv5zkOCa9Ah6Kw4qeLDmjsEabvBm
	 eSaNueiDKaBpGbxQbPlX29rCIR2iYtk7LJ06Ifbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 714C6F8057C;
	Thu,  1 Dec 2022 14:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F3AF8028D; Thu,  1 Dec 2022 14:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7AA4F80118;
 Thu,  1 Dec 2022 14:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7AA4F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com
 header.b="ei8SelNw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa1RV27SeEGu4uYhYaC+MRk3EZpKwY/n1oTy6SlumzKEJCoLuic2hwg8DxVXv0jZZI7m4xIVJTWQqFKW2eOf1EUj8Rpk1ATxBfs8y3k4In+7ECplzxBG5ow3P8VAj3aXfmAzh2HzqVFZ6hxvgsJEqCrlwne48BmH7nwp60WURgtYVmuGr4pK44hv/UznhwSklRJyBZ+N4bYufhRBXRz6iHkbtV+YrXYPNFoP4M/LpOtc6MzvYkHVBlt81HBdcz1rWBiaCNfcxw3XBZSRSOsjhWNAm4KkRR94QVV7U77NMoxLSAdx6K8SWrpDkOqG9YdsvdmcLnXz96CpMPdffQKb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDMMewQIVfisYwBCM6DYMfSEv93ctBbb5XGGKowMXhA=;
 b=laYRds+ysPo0VorQ64CfYUObVqXaN/1jqmegT0wwi9ouGJT1OM8Su2A++YlAh/hQOmDer/COOSpfs9pY6HI+xG+jmSZMvr7VLAVWO9lNvcyPB5MG3g5Bvwg07/Qy9frUytSIS8k88lf+AXjcwckh7AKTLTafGoMIz4+YAA6BefhYJEruZLxlBZ/fz2U3ctGtPp+BD02efkIvVXvNC5YPcxRL0kDZrnmvrCVENYA8jQvSVBJPE1c2t7Baz2kC1e8cidW9qCscYS6To1JiThP0+6ApPI8dhCTduajlWNm0SvAtbZMssepb6VzzfvDhcsvRdlH0sv8F85yPdZxUAAkIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDMMewQIVfisYwBCM6DYMfSEv93ctBbb5XGGKowMXhA=;
 b=ei8SelNwhMFTYFk9yRhB3FllTWufM3E0ZzX9M+X/x+ND7lVxaKBxRRr319x0SFtlj2jAouy9goStkJvaT8CP5aC0Wq99+LCOnbMFhGVa9g4P7vfDKi45QVb5E7e8GnHmMNIylXqZzFiavLzwe1ZiR50eMyJKUITLYuGzuFJqh/kHD2qBzFZToCi6UPz+NWHojpDvr/bbZ5hBQPvpMWvD7SlLf3SI4/OJMjL/LE0SA4ag9OvQN3TWZeJMr1UonLNCG4+ubnFBIQ+hmxez0iqF7JbvP/1jQaQqJdPunRLCMRFC4zlZJ5tzvvBct2SpxQRT+/hPFiO8GnqbwpmEEZlIHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB9128.eurprd04.prod.outlook.com (2603:10a6:20b:44b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 13:22:17 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::ae59:a542:9cbc:5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::ae59:a542:9cbc:5b3%7]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:22:17 +0000
Message-ID: <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com>
Date: Thu, 1 Dec 2022 14:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Oliver Neukum <oneukum@suse.com>
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org>
 <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
 <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: c73047c3-a408-49e9-65be-08dad39f1161
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZnmlJHzbIHjdrxLyk6bi/9npKprqboX8CCjVLx0FgI7eloogKF0rY0DBKeCyRTbF2nUcj9kusT66inJntwPYUB+eCFPkcjl6xjm++6bhiwnv7Lt+jDodR7VzmTvixFKpk5vdjq7JWxVsqKNLREID9GoAu1qk90cXPnHJegJFqX47e2DV8rlyxvGOzkPiO8cFgQWtisJ03rj0GX9zKd9U+scuoQbOuYN0hhfWVKpHOl7gd4shzaLGJ2DJDMI0ogUpPDQ6K32R2yimnwh0XHP305FZ492EvvkAT0PRQ2ejPGHZGNAjau8vi75h3hSklyf1r1wSCwwcUZqpX/Mp6lvZtv2nKP8F45z5h2XbNdzodEoPJkiQ1wiT1UcYlcIzVU/ouISrCxeDKuHPNJheyrKMiyjLDE+VDEOTbciVNjrtvBjaVPmPMJqek+HGZOuw93a3Maz0D6eIyv/ygDQ/ek+quS21kssshzIPQcPwvSb++7K8NMXUlP86ka1aQD8vWL2yQDOQ/RSgbAfjQtwoQ0bDeGS8l1DZMC4eRAhdDjxQ8CQNBYMX2vSoHDKF2tcozAzphcWJUQtZBqGS0T67f4i0WIOvfr8PoqYJ3t5lkMu/1wPfthYN6dNdBGD+bHCfeW9+r9N3c+kL+VUnVIcyJ6c7o8pbziS7DF4zBV+K61f2NO7w8dXuphzFkHwVK8U9/yXHJq8fFsSjS2996AI4QJOn2Z0zyWAT9wITp+x6O+bvi5vSqIZuUJ7v9l6S11XJA8c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7104.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(36756003)(31696002)(86362001)(54906003)(110136005)(6486002)(966005)(316002)(5660300002)(7406005)(66946007)(8676002)(7416002)(4326008)(478600001)(66476007)(41300700001)(8936002)(66556008)(6666004)(83380400001)(38100700002)(2906002)(6512007)(53546011)(186003)(6506007)(31686004)(2616005)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3Z0bjdnYWNLaXE3ZWprMlg0TE8rWkRNUTNWMFdCKzU0cURTaVpQZlRsNDg3?=
 =?utf-8?B?QjNmTC9NU0Q3RUdDWjJheXRsd1MxbUo0dk5xLzNaSWUvWjR6bFFlMS95bE9z?=
 =?utf-8?B?TDk5aVNSN24zaUJPbVlRTGt4OW9oQ3RPZlhJcU5aOWlCdUFOUVpJZ29ELzhP?=
 =?utf-8?B?cWRSYnpMQjlQaTFMWHUxWTJaeXo1SVZtRGZvc3I4dnh6Vk5tZnJoemtJNmxG?=
 =?utf-8?B?UEhmVDVuOWVndHdlMk8yZUZ5OU9pck8vRUhPQmJOcjRjR1pEZnRQYk8yMURO?=
 =?utf-8?B?Q0QrZ3lheDNORFA3N2RqcWNtc3RtelExT0huQnFxY21TN2ptM1FUeDhqblBv?=
 =?utf-8?B?K2RJWDc2SzFwM0RzdERubEs2V0pSRjZjK2szaTVhNjJnY3U0RjVVc0pTZCtX?=
 =?utf-8?B?SnBIVmtYcEpiNFBwVGFhdXJBSlVNTHB5c1ovT2VLOFpja0dXLy9RV2dYOVd6?=
 =?utf-8?B?N1ZoRkVoY2FBbkVBR1pySDZMbEZJZWdwWUt2bmRkWFlrQ0lKZlJWMmNuZENN?=
 =?utf-8?B?cm5BSmV5V0RCajhUYW50czlxdEZIalp6Z3I0R3VBeVM4VlB3Z2hkOFNPL2xv?=
 =?utf-8?B?K1hralN4aEFYUFBVZlZlbVVhNllOckF3T01yQWxTZHlEMVNONE5rcjBkZldD?=
 =?utf-8?B?c1FPam9CMDN5RHo1ekJlQTZlYXQyaDZWT1B4bUdhT2FjWjVuSGgrQko3OWJF?=
 =?utf-8?B?aW10SWRNYWJjc1lMQWtHWGZ1WlRIekFvTFQzZkoyR252Z2ZDQ2NTbmdoRURY?=
 =?utf-8?B?SGpHTDNMSXJsVTZSVzR4SjNDQ080QXlrZzQ3RkwrZUxkWXNZcU9SeW9SUlNC?=
 =?utf-8?B?cXRqNnl5ZXI0emlrTmRLRXNyZXp0ZnNMYU9CSi9HMlRZamtZRXMvWkY3cjc1?=
 =?utf-8?B?Y2VTYWZ6WmtKU3p1WWNid3RQMTNIYXdyRS9JRHpKeGEvVnllanNkNkFRQjQ1?=
 =?utf-8?B?WkI1TWFPTVhPaFhyY1pjTm40cmpLZk1lRVRHQzdhdXZrVEQzUTYvdUdqUURL?=
 =?utf-8?B?bkVDeFFhdnBsSkRmbDBqM0k3ekdWMTFpd3NmU1ZVaWRPR1hvV3FQWHM3czRu?=
 =?utf-8?B?YzhHSm9Ja1p6Y3doUnJLUzh6Qy91QTU1b0FtK2p1Z0JlSXdoM3N1aUJJQjdY?=
 =?utf-8?B?TXlOR2hacy9DMUFMejhzcys1cEEybTRQZHNvWjJiWWdqZDNMTGhEWmVXM0hE?=
 =?utf-8?B?YUY4Y0ZrQTl2Rk1TUWFzM1V6U1JSRi9CMStacCt5a1dyMlk4YnNFdU9rUmw2?=
 =?utf-8?B?VzRZQWdocjZITHhnanZrMHdYSGNSTU1nM1VIODRUbEgyalVCMzRiOUQ3a0pJ?=
 =?utf-8?B?aUF2RitpdWgwdE1FU3R0bDZCV0tCY1BUTStzQXhGL0xvZGd6ck9scHdVdlda?=
 =?utf-8?B?SXppSjNsNkhpaWVEdGE2YS9lVkJoeDBPcld2VHh4dzhUaFQ0azM1S2VUZVo2?=
 =?utf-8?B?bWhIREpNbERDdU1BRVNaV2d5dmNNVWFGZ1l1QnVYampMSTlRTXpvbVgxeTds?=
 =?utf-8?B?di82bkNDUnZ6VXQyOXFqOCtVNnVGMld1Nmx0eTdsVW1FQk5EdFZYVVoyOThq?=
 =?utf-8?B?SGpRdnA0cWRkSW92bURlYU9rRENxL01NTlc2ZUc2c0VIb2lzMzZDank3cm8r?=
 =?utf-8?B?MnlabGZsZTVKYzlUTkE3dlo2NFFhNWFrWjF1RnR0elBjU2xOTysyR09pa2xR?=
 =?utf-8?B?NG1hT2lyRDJ5bFROV3cvTVE5MmtlUVIxSDVoenBsd3JOWHk5UldSc1A5Wm5S?=
 =?utf-8?B?S0E0VTNYYnlJb29SNjQ4WVh5Z3QzVWplQ2Q3OHNxbEdIU3JpcFBMbzJDTmJC?=
 =?utf-8?B?cFFVRXpQNHM5Zk00VFVDVDhobzd3QWJWaDl1OWZ0MGFnL1N3bWZqL1gvamdy?=
 =?utf-8?B?VWd4YVgxaUFZL3RKKzhNbUhwQjZvN3ZOSDQ3SjhkMENFcWV1akdKV20xdWc1?=
 =?utf-8?B?UlgrTi9veTFrV1pqQ21JTmFZaDRreEwzTldYSEZMWllxYmNRbjlNOCtUNUJo?=
 =?utf-8?B?N0Y3SmkvR1ZSQWxXaFU1c2tyOHZEY3JrYVVnTDhKNUthaG0vdkYxOURRZ2Rk?=
 =?utf-8?B?WjdvSFYrMEROZWQzK0ZkWGFCdGNHSVhWK3MxK2JNdE5FUk1KYmpvV25FUU1J?=
 =?utf-8?B?Z1FteGhwb3F6d2hsY29MMGttdVBLN21JdG5jeFJDaXR3VFdEcklKOHlQQUxw?=
 =?utf-8?Q?ZuwZ2UI2XOxizyvAEN1IkFmskfsSudy1qUlqrYNFrl1E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73047c3-a408-49e9-65be-08dad39f1161
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 13:22:17.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crK/jeiADihc2FQiiMUmK+u0XT3m/D8LYjki0Vt787ft02ee9v/9UCdBEd1CONYioEtJwJjhwSZ+mp5kd4WP6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9128
X-Mailman-Approved-At: Thu, 01 Dec 2022 14:48:05 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 sound-open-firmware@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Dexuan Cui <decui@microsoft.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chromeos Kdump <chromeos-kdump@google.com>, xen-devel@lists.xenproject.org,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, kexec@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org
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

On 01.12.22 14:03, Ricardo Ribalda wrote:

Hi,
  
> This patchset does not modify this behaviour. It simply fixes the
> stall for kexec().
> 
> The  patch that introduced the stall:
> 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
> in .shutdown")

That patch is problematic. I would go as far as saying that
it needs to be reverted.

> was sent as a generalised version of:
> https://github.com/thesofproject/linux/pull/3388
> 
> AFAIK, we would need a similar patch for every single board.... which
> I am not sure it is doable in a reasonable timeframe.
> 
> On the meantime this seems like a decent compromises. Yes, a
> miss-behaving userspace can still stall during suspend, but that was
> not introduced in this patch.

Well, I mean if you know what wrong then I'd say at least return to
a sanely broken state.

The whole approach is wrong. You need to be able to deal with user
space talking to removed devices by returning an error and keeping
the resources association with the open file allocated until
user space calls close()

	Regards
		Oliver



