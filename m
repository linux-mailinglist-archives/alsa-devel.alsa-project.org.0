Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5967688C65
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 02:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B1B1E4;
	Fri,  3 Feb 2023 02:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B1B1E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675387179;
	bh=RAyht+ryjIrwDZccrPWt8+fIh2qMHYBv35cApU0Pfp0=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O1s76J75QoIF1iiN3uoQQ7NAQ7kFhAL60QNNK60oodAE3BkepKQ5vRgeAgkWWjS8T
	 zyDGfOIOjr+4b4TqmUL/BhfaP5bhPV0sISZvzz4t/uEZiCHLdh5oYvygusJeuGRdv0
	 YDl9HpIMlgW1/sHTJeIFw5yHFV50zzGLx8cR+NZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2105F800E3;
	Fri,  3 Feb 2023 02:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F7FCF804C2; Fri,  3 Feb 2023 02:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::716])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92E2FF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 02:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E2FF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FMOL6/i8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAqmQgTv/1rqHPvg9opsMfCjwhDcGsGp4OFX4iKqP9DZkoyDZxzpL3bm09P1ROMJI3yrhXML8xbDtPAO2m1q4vh/5JRVmCobTHhrlLrwePt0d1FPcz10IpTuiXJlJiXYa8IVpw2A3mGZ4Hg/ndGNyq5W3m6MtuHAJ8+t1Vvl2VRXABUZg/dhgAr0xN2zDWmxeg2sJYx2VKuRyxaxY/9ViL5RTPrpnCf8H2oDr9+QqXiHeHZ5QD7wQGWV17D5PZnhhhWUbV2do345Zs5kcaExWbDnmaH4QbOCN0vqVyDBtItdOBxoPnkiWbfZ+AfHz/1P7mYxzwcTMNxoyjn5uSxiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAyht+ryjIrwDZccrPWt8+fIh2qMHYBv35cApU0Pfp0=;
 b=e9HJQPngS4Rr6Lls1JUH7Uay0pCODyPszPysPFEmwc8kg7neH85vbGT3N4CVDrMz1eLzeDr0qKo2GXw0H4aL1oYs3Jhzvmmeeqr5mDxpjinyiWfENjhdsdy9U6Pqqj09X8ZIgdysbVm+DWjuFzM/0FKfsJJjnuEoWq6wWwSK3Ls+DkOcL4HCK6m2Ew+2m67q3UN5LbWyu9psDE58djEUFnyQZw3Cw9Ep8HUO1j8XxxOrav5ewZWrEYOjSbTwpEFAiQAHwzXaKqbmTMbiR52aiaMl+UDyefQxxPGjrP+OvFBbO17GFmpf3RPqWV87vH89l/wlRn5QTtbz5VCOJLpltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAyht+ryjIrwDZccrPWt8+fIh2qMHYBv35cApU0Pfp0=;
 b=FMOL6/i8eG+JD7FN5QnDcU9gqnM4IXj2sF41ZRDLaInxyoyGGJM75eCUIWWGKuGLtfuf5AQujqODqdShk4Fp5lc1boxv8DpdOXSai1Pu8lBnSo7zTNsT9XCehqNjpMi7cGhHvrQu1M2v3cEU0t3hD9/yaD14Y4SlQdNXUBpsxx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6120.jpnprd01.prod.outlook.com (2603:1096:604:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 01:18:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Fri, 3 Feb 2023
 01:18:25 +0000
Message-ID: <871qn7lf6o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
In-Reply-To: <CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
 <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Feb 2023 01:18:24 +0000
X-ClientProxiedBy: TYBP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e361f5-f944-4fd8-1adb-08db05848c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YMJGak81Dx9qpSMap7vULyOPkEMC93lbtEHpk8dKBqYLP9pQxxMzXmihL8njL+XdKNQf4SUAvfF5mHdK4K92q9kSFQZHCSd9dZ1zN2MINxhgDpiJeaVXCMEyYsr20PVxzHjIw7H2wWCzIXUqCIKJva0PusgzjuIkl+Nx7RZBX24dkHg/gKiinoJhinXirsWbxy9TL0K7UXtkimnm7EXgWblQEymP3/8h8RzGAa45grhnKj694OsH1eH9cpG+/hL/l+Zz7IRKNpQIRq1g5FsjRsFlPmrUo2md2oeSz4jpk+RNVDmcutsjKvmCY+gfcmrc26BkDAAkSsTUIttQlldoPKTiZp/GM8aAT229EvjDETP9J0bOr0eykIYpQf/HcSkyzG9xYl8OKqGKQoQrBJay5Gtuusf0FJaFc4QXAtpyBbMGU4n6XRVN6z23tHES6WxN7QWmEKl7XVoXH8st0VAMyd3KcIyisGvrJiAu7pOBVyCQcUQi/jPnwym6R+PmJhX3DW6LObp2g+I1RPQAkdKroPw8T9vr/+OrgL3mBUCm3yEflDn00LAk2aC6G2Reb9mY8w00uj+FZH9hmvwiuZoE8aE+31zmXmfkkILpkpuPyPzDvoR+IXe/C/9D5O5qr3Ri5bfxsC/u+yoaUmEZuNp28OHM5+FukUaHBwwf/3xQSqemAHmgsGd0Qm3IVNzaLc8dQeafMW8IUIMwk4SnOr2BG+Jx9wMVpC/s2jL2fSfaERSgeQ+1dx6W/uTfI2VEhNbV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(2906002)(4326008)(316002)(54906003)(52116002)(6486002)(478600001)(38100700002)(86362001)(38350700002)(83380400001)(36756003)(26005)(186003)(8676002)(41300700001)(6512007)(66946007)(8936002)(66476007)(6916009)(66556008)(6506007)(5660300002)(558084003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JGEBCdNrlCCMeUt8f6L0tQXDwSCyYMgFjzfoAa706oaohLEMPXh0PGu6OKgR?=
 =?us-ascii?Q?aOCdRwZleZPUp62TnjgBSUCs0hPggljq4Rmc8aCpkzm6fwTeCdKvdfslpdAk?=
 =?us-ascii?Q?TKMXf8oaEpL9wbDZVZk4cpfm0q4BhIcyhEEKbFgSbfATeDAqR8KU62lcWidj?=
 =?us-ascii?Q?FxlJ+d32ejorYRylw/pD30cFMxiILSRdext5QqaLyhi8Crg2Gn+qCK51eBXV?=
 =?us-ascii?Q?kH5ONPUX7HrrJUTBIQRAEjlpV2fsmEd6711CuY5RswjM7xhgxDpli8yqII4d?=
 =?us-ascii?Q?JOckYRPJ9cqG5nv1v1OM4ERQjI7uLbSpGcP2vF8zBIE3HdbykZbtGRgxDodD?=
 =?us-ascii?Q?lei7fiA29KK+5k+tuoMDdL23+i9agNDzVTw6FpafKZ2foBU77aMoJBHDgbLy?=
 =?us-ascii?Q?7qRTLLw6QvUrCy63yCkGL0Jw8I/0f0NhIkR3w0Z43flrWJKnqQhmgRD4v039?=
 =?us-ascii?Q?WtDoLyLOWYuHLNg/p5AEAyHs3Rya3Evf3DcGBxSZgzRkY9lmAglFgVdEGYIM?=
 =?us-ascii?Q?vS/EWSwnCeHhieJDP4X1XkC0Q14Ga+GizejCuddv8Itlg4Ea09ztMA063aDa?=
 =?us-ascii?Q?K8uSJoOm4z0upSPxqEMaWbDBISUXb74inB5LU47JpdcUKffuPgd7J9K4cbSx?=
 =?us-ascii?Q?3ik7kXtiK1+s1wEx0hBk12iONN8PQcnyCSDWMQcZlEvAs9G1i0odL09sZskA?=
 =?us-ascii?Q?UC1lGuilerOBtWHYnkZTKmDYYOmTGDBMxeeZkX3RZvtSEoFhQHPEYJmM/cVO?=
 =?us-ascii?Q?m+6udezMpG+FF2+pncafFl4Du6iQW3YzjxRlH5amSPL/fNiHwM9OicxzQKBm?=
 =?us-ascii?Q?oaYeiP/iR8K9YIlHLKdY6p5fbqMg9Q7eoa5jkn1vV6hlVXADkk5A6baZJ1UO?=
 =?us-ascii?Q?8UJNPubNRHYGLjmwJmYATGTljHuHUowwwU1ZdDzLsc+ofW+lxmgLydJ9js50?=
 =?us-ascii?Q?lLAK18o1IleEPFDJf87h34r8bX+VaqTHf9llPwtiGtauKPHQ8EAG13VAukXx?=
 =?us-ascii?Q?hO+O0V4z70RFh/48TzvEiD4/pktmZRzJn90BFW0+VDtGGBgBR+usS+fYpYn1?=
 =?us-ascii?Q?9A0dr6Fmo5xsJLM4/x/eVxquY6tTXWAoxBGM51jxAKBnZWMqljO6aFfSIP6R?=
 =?us-ascii?Q?AYOHLX2f7jahGd79BS/mK+kC28ytIpKaYZqz/SoeOoKgEYN5RJc2zg6iPFum?=
 =?us-ascii?Q?KQnVf3jV6Ii3ocBV0GX5wCaCKqWtLsdBy47pgmdCjyWGcA8lbjTt1fs6EVuD?=
 =?us-ascii?Q?fTO9tsLSW1RbXTgrbu5LN0yIvapL8Jgz2G7QMvFB9QxzQLwRBEe+eMigQute?=
 =?us-ascii?Q?Qt5NDOPnw4o4peqZkyTcdsuK90bKsXv8RwtgRDtKEkRKfvyC63zQwC8YIDly?=
 =?us-ascii?Q?30TkJ5U+MWWVLv+W13STOpmSMc6ckgsUlr0dTWmKBt36ZYl2UfeZ3BenyCDi?=
 =?us-ascii?Q?6mY3bRUEwsoLaeLSsZScE3hjUXshd+OsOgu6jqw8A37/8b+Ic4mMthqYvZ4g?=
 =?us-ascii?Q?OXywT0TV6o6KM7N1TUxt+6qOAikNdAJQZMdnnbiAqUqErdjDg26yF9TSx9Th?=
 =?us-ascii?Q?a1fR6N7NooRpV8bolXd3u7ZkHou9TsINkCZ+bF7fcoBG4eewxLh8uOKhqvnU?=
 =?us-ascii?Q?gt7qZKutknYp/tOFtNGJQXA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e361f5-f944-4fd8-1adb-08db05848c57
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 01:18:25.3116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl+d7cyQgOgI1FHrpFKlqGCg0nSO38fBZUDCIHH85bw/v2SSOgk1c0EFZxuL9KO0gsKOqh3aT5jRTT6GvQ79LoakiEUoScDjvZVLTqqHVEJf1cLi1FjaELVCsfenkNTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6120
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Geert

> I think you forgot to update the reg-names section below, as it
> doesn't match its user in

Oops, yes indeed.
Thank you for pointing it.
Will send the patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
