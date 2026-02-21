Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MxBHxNNqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:39 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277DA20270B
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF396025F;
	Wed,  4 Mar 2026 16:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF396025F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637456;
	bh=a5FrRhwGYl1P5RTh1rL9d3P+7i0nvLf9j0iKjDM90n0=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C+W8iZvqWJHPGE+FjOtfrK26D9DWvmLHy/nAZZXgOO+THj9gVLv/eXMQuR1rgDy47
	 0EZfpFU26yvj6EucKZBc0x1SZMA48cjSD6m+kmEfZv/SxY3F78wMIvwqY0ON01JHW+
	 4YNYUqx0IZEFZP3v02O0iJ3FGtjT0yMdUHAyuhAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A61C9F8067A; Wed,  4 Mar 2026 16:16:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C4CF80673;
	Wed,  4 Mar 2026 16:16:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45A8EF80496; Sat, 21 Feb 2026 13:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazolkn19013086.outbound.protection.outlook.com
 [52.103.35.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2149FF8025F
	for <alsa-devel@alsa-project.org>; Sat, 21 Feb 2026 13:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2149FF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=bpBMDwq/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jrk89ntZzRhC5Z/b1DrKXyrMa6blc8S+WBlXOtvi+N0zUuL6uIbFIUBd8gtiYkGeGRMg9AwG7QWuPjuYXgnoTqc5CbWKY9YQqINuOxeRecMFAjWhOjnnwb6d+H6UCIRBmDYM59DRlHcUzFSXPLSEOiBR2CrURv7AJkmqlju6yxOanaz7wXsMSrBKy8TsHbfnFeCFyVj0Dg3e0B0miWeHW+HtFij98GXE1LxiFx473AF6mPgUTE8MY5GqSSQOm3grXszVnHuR5J8PzlL0dr2FCsLUtUb+yyZ2PJaPEuEl0DtLRh+gKUreSP9nUK0EzhYZLjtob44HM+kyAx8rVhjVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYb33oyun6WmAoVzD15MMyIwl0FICy/ikFgM4lcsmWs=;
 b=pxfHR6Yyu9x7Fg46DfcUMyBGeZpLT0u+DvuJFemGW484GXL/Q+7bTOkNZ6+8X3T5rq08ojOr+NCP8BnG8GkRqeVEi49YD/s1O/Oh82r0R1ZWrzMC210OLJ3R6VXIsRr3nv0YZklEyn2mlkTxwCZ8NzhuXtjJQ7eyXuC6Rd5v+mk7k5lqLGceNu3pdfHcaqAau9WvZOPGj1cB+lkhG7cjhS4Y3eZF+VtngaLuA+qV+svZdO/mv3gki3x2oKMOkrM5evkGrwfS1JUkrjFPtiEbiRzl0lZivx/G3C3RrhZbgfAPNEIrEWxz2sleNHLZ8eR7f0/u2K4N2LQUSDiKMNYc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYb33oyun6WmAoVzD15MMyIwl0FICy/ikFgM4lcsmWs=;
 b=bpBMDwq/QUD0kafP0415hjy2vNubtc9hR2w3ynJrmkNjX4XXGWtNe8+uojHGlDdi4fxf1yHxb0WFh51eLmszoImhGID1RDMtaCSO52NGQgpn05KggLOHQOe6GxdHRvqo4kKOqj0iGtLMMp5eZ06peFu2RZ0T7GZDb3mgnYNNULCmDiH11DIKr4qon0QGYHJX49mpkU7zW7xUfha05DW37eLHNrdoR76uLZmeTOHcdkO/2/FlhFWzH0qe89hQGMeaJtZrjRg9DxslPhorIthD5fX0zMAd+h78RJDKi9H00T/QIfxjlD8lMv2KV8YQJOAkfLnu2h9LGJxqS6bUQhG3FA==
Received: from DU0PR09MB8313.eurprd09.prod.outlook.com (2603:10a6:10:5c9::18)
 by PR3PR09MB5363.eurprd09.prod.outlook.com (2603:10a6:102:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Sat, 21 Feb
 2026 12:58:23 +0000
Received: from DU0PR09MB8313.eurprd09.prod.outlook.com
 ([fe80::beed:7674:e74a:e6bf]) by DU0PR09MB8313.eurprd09.prod.outlook.com
 ([fe80::beed:7674:e74a:e6bf%5]) with mapi id 15.20.9632.015; Sat, 21 Feb 2026
 12:58:23 +0000
Content-Type: multipart/mixed; boundary="------------WmfSpFHLfgcPU98fjKpnlWBQ"
Message-ID: 
 <DU0PR09MB8313056263CB7469B44D523EB869A@DU0PR09MB8313.eurprd09.prod.outlook.com>
Date: Sat, 21 Feb 2026 13:58:21 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr, nl
To: alsa-devel@alsa-project.org
From: Didier Pollez <dpollez@outlook.com>
Subject: =?UTF-8?Q?=5BBUG=5D_No_audio_on_HP_Envy_AIO_=28ALC274=2C_103c=3A86c?=
 =?UTF-8?Q?6=29_=E2=80=93_amplifier_not_powered_=28Bugzilla_221112=29?=
X-ClientProxiedBy: AS4PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::16) To DU0PR09MB8313.eurprd09.prod.outlook.com
 (2603:10a6:10:5c9::18)
X-Microsoft-Original-Message-ID: 
 <2843aeb1-37dd-4ccd-80d6-b177fbcc974e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR09MB8313:EE_|PR3PR09MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb8ce21-c140-4fe6-56fc-08de7148e51c
X-MS-Exchange-SLBlob-MailProps: 
	f3ElpFvzDvbd+xQ5tkgEernUWapCSLIAhtTvh85TiCRPULgTE6oSBoRHCeSiwfqexlztyfY3/24ba+1oID4iPWhoCJTbs1vVq8SiyIb2Ix5f2P7AfDhe7vFVZomru5bNxD1vjiRMRin4A9wBPF4a9e4P+6gdtz1wqkXLGhLmAtHkniju373nSz1K9LF4I0WM9kQAJXT10Ikd9ikxcod2IRWWpSwKhlHGaSTwjqbA7A9rZ3S06tyDD2xOABP4QapxsBtdyLQEbNlxoO8ugkS9zOJ88rJSTtjtBKu9J9lVHREx0N8Tg41ONlP1YANMXjXc2rB4aQzC99xUP1rNW+UB8VBaPzvGrWZSma+OetqDoxBzKSpux8MZv3sOrxwRA6OV6OVbbeF3cgZSVnEfhRz/NMCzet/brNvtnfYy5/SRdQLCMwD4tXSFYS5TdxfqwAc/HRabZsoGB5v2sFpQ5zx/KGjV2tAWRZ8T7PN7Yxj9PS/30x0916x/s2hpHSmqQLdSzEAX3RhBWB7ypZlLUjrRye1K2/0kv6eVqiqG/xyfOe+lP30eshLCy7THxuxsrWZEtevt6419pUrSWHWDExLpbyu84+15OdgpgnnYkMSQjooEOSfU8e/OI7Yaw1rmmS4rvwyaxjORGjip1hzC/J99NllrcV9yZXGr1vxstDIbCRpBeI38kCqvg5+HFfrVOxlaqx/7lOB1yQZ4Q9AcJICv3wAJQuanmyQDkd5lmN26xsm7cDX8nlx4UyRc4H68AoEtrP/oFwN/xFw6/UUmdkOtn4jj3soKk9eT3UCDgh1mA589opP3mmTIeilxkBBFh+pj8tqqoVsXSPfcMYUET0vyaK3m38Vtst3MEFxeJdym1quaJIPyy6yobyblsWSbvKQi3Km1sFeSA68=
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|23021999003|12050799012|6092099016|19110799012|8060799015|41001999006|461199028|15080799012|5072599009|20031999003|39105399006|12121999013|9400799043|440099028|3412199025|20055399003|35041999009|40105399003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUhrREpvTVhmYm5rV09lWHJWUUtNbmYyY2F3UzBaTjE3VzgyS0RucXlxdkdW?=
 =?utf-8?B?dEtqdEI3NEhaOHVvdk1TZTE5bFFURGcvQnMyZDBqdTB3SDZXY3hrcEhHM3Zk?=
 =?utf-8?B?aFZrQjdWRTltQkczYkIzRXVBcE04bzQrcEJOR2VGeEQ0dURvdlNpeTFzbE0x?=
 =?utf-8?B?QUVwWXQwZnFxcmV3RlU5NDB4R3RVNmtNTzVDQm5paS9ZejN5UnBWWGxSdmZ3?=
 =?utf-8?B?WGt3eGZKWjJTVWdEdGJjYU9pZlZWa3lVM21pRVNqclRTVkFxUnkreG5rMkFr?=
 =?utf-8?B?bnI0anpWTWFkZGVGY2owRnkxU0tadDFneE9KR3RJdlBuQk5YSFVPMEFnd1ZU?=
 =?utf-8?B?cGE5WnVRMFRUWmszMDJ4SHQwU2RCNXVmV3pzRHRZL1E3cXJEL0g2REJRRVFk?=
 =?utf-8?B?M0crWXZ2bFFsNHNLMnBER0VqT0svR212Ly9Qb3BHalduZHEzZ1R5OXRJWmtZ?=
 =?utf-8?B?eGVNTlZIbVdhdG1URlFBSzJLTUx2NWhNTDZPRGg5TXJXVldZWTZJdHEwQ1FH?=
 =?utf-8?B?dWlMOXgvMm9LWm85aDdOeVFLUGViM3g0Ukp2eE80QzBSRnBNNzlSdmxGbDI1?=
 =?utf-8?B?d2I2YmZQb1JXSkFweG1tM21qQS9YZ1FzWUVDaUxaTEpHMDA0SkZZQnVwdlFu?=
 =?utf-8?B?TVZKMkwxUElYQWY0aHRLWlNpMElUYXBNZ2NOQ3AwSWN4a3pncFBlQzcrMTlI?=
 =?utf-8?B?SEVXY0NBcXBhOHZiZVd5MWRBcWlYaWdzWVBCekJiRzRiazV1ZFlmWjhZUFZU?=
 =?utf-8?B?QnkyTWFRelZWd1UzbDVXemJPZkF3OXBHYmU0T21oZXljSEEyYnFXdXFBK1d0?=
 =?utf-8?B?ZDI4dUFFNTdiTXN0aDJDdVVKUlpLTE0wS1dBVGpYTnhhQitQeWZrSXBzRzRK?=
 =?utf-8?B?QWxzb0ZlKzIydVRMR1E4Q2FaMC8vUjhPRStIbHNQQzRLeU83UFpvSXRaWld4?=
 =?utf-8?B?V1IrWDd3NUd4UHdyQlREeTZ3TC9sZGoyYWNhdmc0azJuOWEvYS9kcVJTV09t?=
 =?utf-8?B?dmhYM05xQWtOeThDOFZHV2EyZHNacVhheHo0MzJoN2dzcld5ZXpHdS9WOUs5?=
 =?utf-8?B?dG12YjRjS0p6aUpMT3RGMzVhb1VuS1RDY3c3WUFZWjVVcFR1WW1kNHoyN3FE?=
 =?utf-8?B?NHovLzV3WllNamw3dnNsWHFCTG4yRTJCaGcydm5NdEk3bDFES3dWNHhpYTZi?=
 =?utf-8?B?b1FHNHFNMUgrTzRzMUVrWE9DNzZGbXJtaHY4OGJBcjFjekVySGtNQjh1NTNp?=
 =?utf-8?B?dUNTdnZhSGtCbTFhZnFQd3FBQTRKN0p2eG0waEZNK0ZwdkxzczZPbjczeEVJ?=
 =?utf-8?B?dkJuaHRvSjYrbStRZFBDbGJpck41cnQ1NCtXYlJHZ1p0WnM4OUZBN0JoMTRI?=
 =?utf-8?B?WitDa3BFek9FaHJHbEFvTWM3TnprK2ZRajZkUVFFUVkvb0xuVWZQdDh6RmhP?=
 =?utf-8?B?WnJrV08wNmpMUXRrN2JZcmhxQzV0R0RiOGw2TnFrVy9DZHF5WS9RR1hQa001?=
 =?utf-8?B?YmdlUjc1NFFvN2xCcytRSkJLNU9mR1hpeVR4N016czF6U1ZtSC90TnRRLzV4?=
 =?utf-8?B?aFNaSW9IcWljV0N4Y2RTZjZMeWNDTXh6RGRKdVdiaXJJV0ZuSGdUWTFORWtW?=
 =?utf-8?B?ejgydFZ5SFNkTVNKczdFNUpKTHlPT0FKUTlpY1VOa05JYkNhN2I5Mm9FanZv?=
 =?utf-8?B?Z0hnMFk0U20zTWd2cTE1czZZUHlTZVQ5SDFSNjVrRWE5SWN1bkcyN1grTDRF?=
 =?utf-8?B?VlJhK3BjYkNNcGpRM1ZkS1NQYnZHRGQvQnk0aDdtRWJQODBCR2tFUmxxN2FJ?=
 =?utf-8?B?MHBSQUZaNHV0L1VGYXpETzFTR3hFeGpBenFxeTVXamd2YjROaldBdG9ISVJO?=
 =?utf-8?B?S3QwSlU3dEJvZnhOWlpoR08vaHBDQ3R2RzFqeHVGQVhGVEVrZXpEL0lVeXJU?=
 =?utf-8?Q?A3BRgQ4OdpQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zkk4SXI3TVhWbGtqR2NxM3dEZ01rUHgyTDAxUkNIK2VBVEZ0bUUzeDVta3oy?=
 =?utf-8?B?TEZvWDdpUW0wY0ptM2laMHpqbFlUbkpSZHRNeFdrOWU4TC8wckV3eDkvS1Fk?=
 =?utf-8?B?SWZ5VTFKVkswRjFsMERIcWhHSzJzSEVFbm90V0hmc3dWWnJEYys0NG5nR2Q3?=
 =?utf-8?B?cm9RMHcrMTBpMm10dzZBZzFBOVpCS0FaRTRUa0haVkYzNEpLMkh1d2R3L2J2?=
 =?utf-8?B?OTRlZDRNSlU5dFJQZnF3dnZqQjUrUHBScWFpUTVQdUkwbXdpZlVSMmJscFBW?=
 =?utf-8?B?SHpsK1cwTG1ZTFpvZDhwVlZKV29ZdnZISGRXekdNUVlHZTE1eUl1VmZaa01a?=
 =?utf-8?B?S0o4OVJUbUJaUkt1QXorZUo4UUpvT3h5RGtscHFXdFJaZWk0cW9lTEV1U0VO?=
 =?utf-8?B?a3BqcjFlS2JvY0pUQXphQmZZV3Z1eUMra2JNSy81UWxBeUpGZHdlbDN5V1Vx?=
 =?utf-8?B?VzZNZ3ZZenhUSVhjdGpLTVNZZ29tK0RsUm1seWNwNE5Wb1M4UStQckNxZm15?=
 =?utf-8?B?TUxwbmlKMnRCZThnWU9LWW1wZDBRZCtZb25GRm13Q1JFallteUczN0dSak5T?=
 =?utf-8?B?ZjhwUGt0NnN4SXcxc2VDdkZPKy9mZXlVcTF5ZXpURzhMM1J4Z3JkbW1lWHV6?=
 =?utf-8?B?aXQwTDVDOHZUVWlxTjcxTHNyYnZqVWhyTTZQUy8xV0ViSkdqK2RlMkNNMVdG?=
 =?utf-8?B?b29MVEgxcG05NWtLV3lQM1hTZmJGYlNVeGZESFlJa3FtNk0wMUtSODZ3b2VB?=
 =?utf-8?B?MUdkcm5rdXI1UGRwUllTa1FmMHEyRzhQQm9YYjhTVzNJai9SaWREWXlaMWhz?=
 =?utf-8?B?Z2FpMDQzeXRkZFM2NzJ0YThXR1ZnTGNLQnpLWThwRTdMTWVOWU04SVNXR1ZB?=
 =?utf-8?B?WGJYVHhzdWYxWXZaelEzb24xdFVTZXpzWFQ5bEtyME1XNHVDeDJWckxYNjcz?=
 =?utf-8?B?ZmswS2dPSVVlWnNyUS9MWEtEc01QS1pjWGZlOTBjcGdVVGlJNE1zd2RYdXVT?=
 =?utf-8?B?MThJdkZCa3N1b2JRWVovWE12V1A5UEloOXcvdUhnWlJGVnprTWUwR04wK3ND?=
 =?utf-8?B?K2ZUei9BK3hRODhsYU0rZFVMQWhzZ0lMc1VqanZ4SExQU0NTTHJDTk96c3Ar?=
 =?utf-8?B?eWY5NHlRbkhiMW45K2dmL2V2SDlLQ1J6V3laekE2ZW0zcnQvZmp6UWhjeFh4?=
 =?utf-8?B?WjYyNm92aFZUdXEzaDJsRXFTblpEZ2xqZXVvOHBOdk1aaUpCNXF1VHg0bC91?=
 =?utf-8?B?L3JGT0VmMXNoOWFqcHkveGdJelVJcjNlM1FUaXl2QUhsOFdoVjRuSlAwaEdm?=
 =?utf-8?B?Zm5OTHFwczJEczAxcnlxUU9KZ1lWakRsMm1nblhQTk9zcDVtZkZBcDM2MjlO?=
 =?utf-8?B?N1VNYkpkTDQwTnRZUVQ4ZGRuOFlwanZQR3l3NEhzbEJYc1lNYUFRYlBxbExZ?=
 =?utf-8?B?RGhlVG44bXBGZGkzbnIyc2tkeHlGQjBmemFla3VRMVBiOWE5ZnVaYU5RTHB5?=
 =?utf-8?B?MHpsUDUxa1o1YjFFbkxjWmZqcGxKVXZJTUZZcWEwRXoyMVZmRkEwK0pvS0F4?=
 =?utf-8?B?MDkxbXFQeUNQdjBrdUVrOU9zMUx5MWNnOWRHRjAzN3BMZHhGSEJ5VWV4eG5W?=
 =?utf-8?B?K0U5T3h2cFZNbGt0SjZDVXIrUCtjKy9ocWo1T2dHSXFCcEVFaWVjc2RuK2tS?=
 =?utf-8?B?eC8weG1sVVZ0bEdCN0E1UW00Mzh0ZHJXZVJqUFhZR2x3OGpLN2lFVHV0YUF6?=
 =?utf-8?B?LzY0cWJkUHlKKzVMMWk0eFNTcXV1b1ZSdUNqQ1BhMkJWMCtHS2I3RXRZOFFJ?=
 =?utf-8?B?cGdFeVNSM044enEzQTA4cTc4bnRtTmp0NUh2QVdsMllNQ1oyTVgyZEtuU2Y0?=
 =?utf-8?Q?eXxTV0ET1RM5w?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebb8ce21-c140-4fe6-56fc-08de7148e51c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB8313.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 12:58:23.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB5363
X-MailFrom: dpollez@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KCD25ZR3A6L24BAYBAJFSLEYES6F3CRD
X-Message-ID-Hash: KCD25ZR3A6L24BAYBAJFSLEYES6F3CRD
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:06 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAX4GFAOSEZNSZTM34HOXYXIIPV6DC3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 277DA20270B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	DATE_IN_PAST(1.00)[266];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,alsa-project.org:url,DU0PR09MB8313.eurprd09.prod.outlook.com:mid];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	R_DKIM_REJECT(0.00)[outlook.com:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[dpollez@outlook.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,outlook.com:-];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--------------WmfSpFHLfgcPU98fjKpnlWBQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

*Title:* /No audio output on HP Envy All‑in‑One (Realtek ALC274, 
subsystem 103c:86c6) — internal amplifier not powered, no DAC output/

*Summary:* On an HP Envy All‑in‑One system with a Realtek ALC274 codec 
(subsystem ID *103c:86c6*), the audio device is detected correctly under 
Linux, but *no audio output is produced on any distribution or kernel 
version tested*. All mixers appear correct, jack detection works, and 
the internal microphone works, but *the internal speaker amplifier never 
powers on*, resulting in complete silence from both speakers and the 
headphone jack.

This issue occurs on all tested Linux distributions and kernels, 
including modern kernels (6.8+). Manual HDA verb routing and 
vendor‑specific Realtek verbs do not activate the amplifier.

This appears to be a missing *HP‑specific amplifier initialization* in 
the Linux driver.


    *Hardware*

  *

    *Model:* HP Envy All‑in‑One

  *

    *Audio codec:* Realtek ALC274

  *

    *Subsystem ID:* *103c:86c6*

  *

    *Internal speakers + headphone jack*

  *

    *Internal microphone works*


    *Distributions tested*

Distribution 	Kernel 	Result
Linux Mint 22.3 	6.5 HWE 	No audio output
LMDE 7 	6.1 	No audio output
Pop!_OS 22.04 	6.8+ 	No audio output

Behavior is identical across all systems.


    *Symptoms*

  *

    Sound card detected correctly

  *

    PipeWire/ALSA load without errors

  *

    Jack detection works (headphones detected when plugged in)

  *

    Internal microphone works

  *

    All mixer channels unmuted and at 100%

  *

    |speaker-test| produces *no sound*

  *

    No errors in dmesg or journal

  *

    No output from speakers or headphone jack

  *

    Only a brief analog “pop”/“rustle” when inserting a jack (indicating
    ADC path is alive)


    *Codec analysis*

 From |/proc/asound/card0/codec#0|:

   *

    Internal speaker pin *0x17* is routed to converter *0x03*

  *

    Headphone pin *0x21* is routed to converter *0x02*

  *

    Neither 0x02 nor 0x03 is connected to an active DAC

  *

    The only functional DAC appears to be *0x06*, but *no output pin is
    connected to it*

This results in audio being routed to converters that do not drive any 
physical output.


    *Manual HDA verb testing*

I attempted:

  *

    Forcing DAC 0x06 on all output pins

  *

    Forcing all pins to OUT (0x40) or HP (0xc0)

  *

    Forcing EAPD on all output pins

  *

    Unmuting all amplifier nodes

  *

    Vendor‑specific Realtek verbs via node 0x20 (SET_COEF_INDEX /
    SET_PROC_COEF)

All verbs were accepted by the codec, but *no audio output was produced*.

Even with brute‑force routing:

Code

|hda-verb /dev/snd/hwC0D0 0x17 SET_CONNECT_SEL 0x06 hda-verb 
/dev/snd/hwC0D0 0x21 SET_CONNECT_SEL 0x06 hda-verb /dev/snd/hwC0D0 0x17 
SET_EAPD_BTLENABLE 0x02 hda-verb /dev/snd/hwC0D0 0x21 SET_EAPD_BTLENABLE 
0x02 ... |

→ *Still no sound.*

This strongly suggests that the *internal amplifier requires a 
vendor‑specific initialization sequence* that is currently missing from 
the Linux driver.


    *Conclusion*

This HP Envy AIO model (subsystem *103c:86c6*) appears to require 
*HP‑specific amplifier power‑up initialization* that is not implemented 
in the current Realtek ALC274 Linux driver.

The codec responds to verbs, but the amplifier never powers on, 
resulting in complete silence.

A new quirk or vendor‑specific init sequence may be required for this 
subsystem.

I can provide:

  *

    full codec dump

  *

    dmesg logs

  *

    ALSA info

  *

    hda‑verb test scripts

  *

    additional diagnostics if needed

Thank you for your help.

Your ALSA information is located at 
http://alsa-project.org/db/?f=6a2e720440841b76482ed621024ecf919c9acd22 
Please inform the person helping you.


--------------WmfSpFHLfgcPU98fjKpnlWBQ
Content-Type: text/plain; charset=UTF-8; name="codec_dump.txt"
Content-Disposition: attachment; filename="codec_dump.txt"
Content-Transfer-Encoding: base64

Q29kZWM6IFJlYWx0ZWsgQUxDMjc0CkFkZHJlc3M6IDAKQUZHIEZ1bmN0aW9uIElkOiAweDEgKHVu
c29sIDEpClZlbmRvciBJZDogMHgxMGVjMDI3NApTdWJzeXN0ZW0gSWQ6IDB4MTAzYzg2YzYKUmV2
aXNpb24gSWQ6IDB4MTAwMDA0Ck5vIE1vZGVtIEZ1bmN0aW9uIEdyb3VwIGZvdW5kCkRlZmF1bHQg
UENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRz
IFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCkRlZmF1bHQgQW1wLUluIGNh
cHM6IE4vQQpEZWZhdWx0IEFtcC1PdXQgY2FwczogTi9BClN0YXRlIG9mIEFGRyBub2RlIDB4MDE6
CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRDNjb2xkIENMS1NUT1AgRVBTUwogIFBvd2Vy
OiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKR1BJTzogaW89NCwgbz0wLCBpPTAsIHVuc29saWNpdGVk
PTEsIHdha2U9MAogIElPWzBdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5PTAsIGRh
dGE9MCwgdW5zb2w9MAogIElPWzFdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5PTAs
IGRhdGE9MCwgdW5zb2w9MAogIElPWzJdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5
PTAsIGRhdGE9MCwgdW5zb2w9MAogIElPWzNdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3Rp
Y2t5PTAsIGRhdGE9MCwgdW5zb2w9MApOb2RlIDB4MDIgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0
MWQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iSGVhZHBob25lIFBsYXliYWNrIFZv
bHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPU91dCwg
aWR4PTAsIG9mcz0wCiAgRGV2aWNlOiBuYW1lPSJBTEMyNzQgQW5hbG9nIiwgdHlwZT0iQXVkaW8i
LCBkZXZpY2U9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5zdGVwcz0weDU3LCBzdGVwc2l6
ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIENvbnZlcnRlcjog
c3RyZWFtPTEsIGNoYW5uZWw9MAogIFBDTToKICAgIHJhdGVzIFsweDYwXTogNDQxMDAgNDgwMDAK
ICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBz
dGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApO
b2RlIDB4MDMgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0MWQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29u
dHJvbDogbmFtZT0iU3BlYWtlciBQbGF5YmFjayBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAog
ICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fw
czogb2ZzPTB4NTcsIG5zdGVwcz0weDU3LCBzdGVwc2l6ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0
IHZhbHM6ICBbMHgzZCAweDNkXQogIENvbnZlcnRlcjogc3RyZWFtPTEsIGNoYW5uZWw9MAogIFBD
TToKICAgIHJhdGVzIFsweDYwXTogNDQxMDAgNDgwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0
CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNT
CiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApOb2RlIDB4MDQgW1ZlbmRvciBEZWZpbmVk
IFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDA1IFtWZW5kb3IgRGVmaW5lZCBX
aWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgwNiBbQXVkaW8gT3V0cHV0XSB3Y2Fw
cyAweDQxMTogU3RlcmVvCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgUENNOgog
ICAgcmF0ZXMgWzB4NDBdOiA0ODAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZvcm1h
dHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjog
c2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwNyBbQXVkaW8gSW5wdXRdIHdjYXBzIDB4MTAw
NTFiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDE3LCBuc3RlcHM9MHgzZiwg
c3RlcHNpemU9MHgwMiwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHg5NyAweDk3XQogIENvbnZl
cnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIFNESS1TZWxlY3Q6IDAKICBQQ006CiAgICByYXRl
cyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIw
IDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAw
eDI0Ck5vZGUgMHgwOCBbQXVkaW8gSW5wdXRdIHdjYXBzIDB4MTAwNTFiOiBTdGVyZW8gQW1wLUlu
CiAgQW1wLUluIGNhcHM6IG9mcz0weDE3LCBuc3RlcHM9MHgzZiwgc3RlcHNpemU9MHgwMiwgbXV0
ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHg5NyAweDk3XQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNo
YW5uZWw9MAogIFNESS1TZWxlY3Q6IDAKICBQQ006CiAgICByYXRlcyBbMHg1NjBdOiA0NDEwMCA0
ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsw
eDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRp
bmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDIzCk5vZGUgMHgwOSBbQXVk
aW8gSW5wdXRdIHdjYXBzIDB4MTAwNTFiOiBTdGVyZW8gQW1wLUluCiAgQ29udHJvbDogbmFtZT0i
Q2FwdHVyZSBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMs
IGRpcj1JbiwgaWR4PTAsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iQ2FwdHVyZSBTd2l0Y2giLCBp
bmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1JbiwgaWR4PTAsIG9m
cz0wCiAgRGV2aWNlOiBuYW1lPSJBTEMyNzQgQW5hbG9nIiwgdHlwZT0iQXVkaW8iLCBkZXZpY2U9
MAogIEFtcC1JbiBjYXBzOiBvZnM9MHgxNywgbnN0ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11
dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4M2YgMHgzZl0KICBDb252ZXJ0ZXI6IHN0cmVhbT0xLCBj
aGFubmVsPTAKICBTREktU2VsZWN0OiAwCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAg
NDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBb
MHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0
aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgyMgpOb2RlIDB4MGEgW0F1
ZGlvIElucHV0XSB3Y2FwcyAweDEwMDcxMTogU3RlcmVvIERpZ2l0YWwKICBDb252ZXJ0ZXI6IHN0
cmVhbT0wLCBjaGFubmVsPTAKICBTREktU2VsZWN0OiAwCiAgRGlnaXRhbDoKICBEaWdpdGFsIGNh
dGVnb3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MAogIFBDTToKICAgIHJhdGVzIFsweDU2
MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAg
IGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQ
b3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MWYKTm9k
ZSAweDBiIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUg
MHgwYyBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4
MGQgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDBl
IFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgwZiBb
VmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MTAgW1Zl
bmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDExIFtWZW5k
b3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgxMiBbUGluIENv
bXBsZXhdIHdjYXBzIDB4NDAwNDBiOiBTdGVyZW8gQW1wLUluCiAgQ29udHJvbDogbmFtZT0iSW50
ZXJuYWwgTWljIEJvb3N0IFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1w
OiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4gdmFsczogIFsweDAxIDB4
MDFdCiAgUGluY2FwIDB4MDAwMDAwMjA6IElOCiAgUGluIERlZmF1bHQgMHg5MGE2MDEzMDogW0Zp
eGVkXSBNaWMgYXQgSW50IE4vQQogICAgQ29ubiA9IERpZ2l0YWwsIENvbG9yID0gVW5rbm93bgog
ICAgRGVmQXNzb2NpYXRpb24gPSAweDMsIFNlcXVlbmNlID0gMHgwCiAgICBNaXNjID0gTk9fUFJF
U0VOQ0UKICBQaW4tY3RsczogMHgyMDogSU4KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApOb2RlIDB4MTMgW1BpbiBDb21wbGV4
XSB3Y2FwcyAweDQwMDQwYjogU3RlcmVvIEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwg
bnN0ZXBzPTB4MDMsIHN0ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAg
MHgwMF0KICBQaW5jYXAgMHgwMDAwMDAyMDogSU4KICBQaW4gRGVmYXVsdCAweDQwMDAwMDAwOiBb
Ti9BXSBMaW5lIE91dCBhdCBFeHQgTi9BCiAgICBDb25uID0gVW5rbm93biwgQ29sb3IgPSBVbmtu
b3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MCwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3Rsczog
MHgwMDoKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMApOb2RlIDB4MTQgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDU4ZDogU3Rl
cmVvIEFtcC1PdXQKICBBbXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNp
emU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgw
MDAxMDAxMDogT1VUIEVBUEQKICBFQVBEIDB4MjogRUFQRAogIFBpbiBEZWZhdWx0IDB4NDExMTEx
ZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxh
Y2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5P
X1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4NDA6IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVu
YWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGlu
Zz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MDIKTm9kZSAweDE1IFtQaW4g
Q29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQW1wLU91dCBjYXBzOiBv
ZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFs
czogIFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMTAwMWM6IE9VVCBIUCBFQVBEIERldGVjdAog
IEVBUEQgMHgyOiBFQVBECiAgUGluIERlZmF1bHQgMHg0MTExMTFmMDogW04vQV0gU3BlYWtlciBh
dCBFeHQgUmVhcgogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBCbGFjawogICAgRGVmQXNzb2NpYXRp
b24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAgICBNaXNjID0gTk9fUFJFU0VOQ0UKICBQaW4tY3Rs
czogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3Rh
dGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBD
b25uZWN0aW9uOiAzCiAgICAgMHgwMiAweDAzIDB4MDYqCk5vZGUgMHgxNiBbUGluIENvbXBsZXhd
IHdjYXBzIDB4NDAwNThkOiBTdGVyZW8gQW1wLU91dAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAs
IG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4
MCAweDgwXQogIFBpbmNhcCAweDAwMDEwMDE0OiBPVVQgRUFQRCBEZXRlY3QKICBFQVBEIDB4Mjog
RUFQRAogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIK
ICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBT
ZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4NDA6IE9V
VAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQwIEQx
IEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjog
MgogICAgIDB4MDIqIDB4MDMKTm9kZSAweDE3IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6
IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iU3BlYWtlciBQbGF5YmFjayBTd2l0Y2gi
LCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlkeD0w
LCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0w
eDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDAwMDEw
MDFjOiBPVVQgSFAgRUFQRCBEZXRlY3QKICBFQVBEIDB4MjogRUFQRAogIFBpbiBEZWZhdWx0IDB4
OTAxNzAxMTA6IFtGaXhlZF0gU3BlYWtlciBhdCBJbnQgTi9BCiAgICBDb25uID0gQW5hbG9nLCBD
b2xvciA9IFVua25vd24KICAgIERlZkFzc29jaWF0aW9uID0gMHgxLCBTZXF1ZW5jZSA9IDB4MAog
ICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4NDA6IE9VVAogIFVuc29saWNpdGVk
OiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQ
b3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMwogICAgIDB4MDIgMHgw
MyAweDA2KgpOb2RlIDB4MTggW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDQ4MTogU3RlcmVvCiAg
UGluY2FwIDB4MDAwMDAwMjQ6IElOIERldGVjdAogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtO
L0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAg
IERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNF
TkNFCiAgUGluLWN0bHM6IDB4MDA6CiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAg
UG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1
YWw9RDAKTm9kZSAweDE5IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA0OGI6IFN0ZXJlbyBBbXAt
SW4KICBDb250cm9sOiBuYW1lPSJNaWMgQm9vc3QgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAK
ICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAogIEFtcC1JbiBjYXBz
OiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2
YWxzOiAgWzB4MDAgMHgwMF0KICBQaW5jYXAgMHgwMDAwMzcyNDogSU4gRGV0ZWN0CiAgICBWcmVm
IGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgUGluIERlZmF1bHQgMHgwMmExMTA0MDogW0phY2td
IE1pYyBhdCBFeHQgRnJvbnQKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFz
c29jaWF0aW9uID0gMHg0LCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1jdGxzOiAweDI0OiBJTiBWUkVG
XzgwCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMiwgZW5hYmxlZD0xCiAgUG93ZXIgc3RhdGVzOiAgRDAg
RDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDFhIFtQ
aW4gQ29tcGxleF0gd2NhcHMgMHg0MDA0OGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczog
b2ZzPTB4MDAsIG5zdGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4gdmFs
czogIFsweDAwIDB4MDBdCiAgUGluY2FwIDB4MDAwMDM3MjQ6IElOIERldGVjdAogICAgVnJlZiBj
YXBzOiBISVogNTAgR1JEIDgwIDEwMAogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNw
ZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFz
c29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAg
UGluLWN0bHM6IDB4MDA6IFZSRUZfSElaCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0w
CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBh
Y3R1YWw9RDAKTm9kZSAweDFiIFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGY6IFN0ZXJlbyBB
bXAtSW4gQW1wLU91dAogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0ZXBz
aXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0IGNh
cHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91
dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAxMzczNDogSU4gT1VUIEVBUEQgRGV0
ZWN0CiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgRUFQRCAweDI6IEVBUEQKICBQ
aW4gRGVmYXVsdCAweDQxMTExMWYwOiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25u
ID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2Ug
PSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDQwOiBPVVQgVlJFRl9I
SVoKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBE
MSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246
IDIKICAgICAweDAyKiAweDAzCk5vZGUgMHgxYyBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2Fw
cyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MWQgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDQwMDog
TW9ubwogIFBpbmNhcCAweDAwMDAwMDIwOiBJTgogIFBpbiBEZWZhdWx0IDB4NDA2MDAwMDE6IFtO
L0FdIE1vZGVtIExpbmUgYXQgRXh0IE4vQQogICAgQ29ubiA9IFVua25vd24sIENvbG9yID0gVW5r
bm93bgogICAgRGVmQXNzb2NpYXRpb24gPSAweDAsIFNlcXVlbmNlID0gMHgxCiAgUGluLWN0bHM6
IDB4MjA6IElOCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0
aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDFlIFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1ODE6
IFN0ZXJlbwogIFBpbmNhcCAweDAwMDAwMDE0OiBPVVQgRGV0ZWN0CiAgUGluIERlZmF1bHQgMHg0
MTExMTFmMDogW04vQV0gU3BlYWtlciBhdCBFeHQgUmVhcgogICAgQ29ubiA9IDEvOCwgQ29sb3Ig
PSBCbGFjawogICAgRGVmQXNzb2NpYXRpb24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAgICBNaXNj
ID0gTk9fUFJFU0VOQ0UKICBQaW4tY3RsczogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0w
MCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBz
ZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgwNgpOb2RlIDB4MWYg
W1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDY4MTogU3RlcmVvIERpZ2l0YWwKICBQaW5jYXAgMHgw
MDAwMDAyNDogSU4gRGV0ZWN0CiAgUGluIERlZmF1bHQgMHg0MTExMTFmMDogW04vQV0gU3BlYWtl
ciBhdCBFeHQgUmVhcgogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBCbGFjawogICAgRGVmQXNzb2Np
YXRpb24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAgICBNaXNjID0gTk9fUFJFU0VOQ0UKICBQaW4t
Y3RsczogMHgyMDogSU4KICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBz
dGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApO
b2RlIDB4MjAgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwNDA6IE1vbm8KICBQ
cm9jZXNzaW5nIGNhcHM6IGJlbmlnbj0wLCBuY29lZmY9MTMwCk5vZGUgMHgyMSBbUGluIENvbXBs
ZXhdIHdjYXBzIDB4NDAwNThkOiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9IkhlYWRw
aG9uZSBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4MCAw
eDgwXQogIFBpbmNhcCAweDAwMDEwMDFjOiBPVVQgSFAgRUFQRCBEZXRlY3QKICBFQVBEIDB4Mjog
RUFQRAogIFBpbiBEZWZhdWx0IDB4MDIyMTEwMjA6IFtKYWNrXSBIUCBPdXQgYXQgRXh0IEZyb250
CiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4Miwg
U2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHhjMDogT1VUIEhQCiAgVW5zb2xpY2l0ZWQ6IHRh
Zz0wMSwgZW5hYmxlZD0xCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2Vy
OiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAyCiAgICAgMHgwMiogMHgwMwpO
b2RlIDB4MjIgW0F1ZGlvIFNlbGVjdG9yXSB3Y2FwcyAweDMwMDEwMTogU3RlcmVvCiAgQ29ubmVj
dGlvbjogNAogICAgIDB4MTkgMHgxYSAweDFiIDB4MTIqCk5vZGUgMHgyMyBbQXVkaW8gU2VsZWN0
b3JdIHdjYXBzIDB4MzAwMTAxOiBTdGVyZW8KICBDb25uZWN0aW9uOiA0CiAgICAgMHgxOSogMHgx
YSAweDFiIDB4MTMKTm9kZSAweDI0IFtBdWRpbyBTZWxlY3Rvcl0gd2NhcHMgMHgzMDAxMDE6IFN0
ZXJlbwogIENvbm5lY3Rpb246IDMKICAgICAweDEyKiAweDEzIDB4MTgKTm9kZSAweDI1IFtWZW5k
b3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCg==

--------------WmfSpFHLfgcPU98fjKpnlWBQ--
