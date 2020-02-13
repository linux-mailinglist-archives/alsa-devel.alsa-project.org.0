Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B515B943
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 06:59:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE291671;
	Thu, 13 Feb 2020 06:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE291671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581573552;
	bh=I2AfceGCFqG6YwgJdnP55cwZC3GNgXXzVnrozooVdCw=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yb/goio4rh9GK7duCX5ivVDFMbPX2Qg87I4xQjHRVbSHgYhjjDSmowgNW1IA+ZiH2
	 +iJlczPYtWtUCuRgxPy68rQ2DLzfzNmhYWgVxuzTK0ILJY5mcsOblAwIEsJntjt0Qc
	 sEvUCUueSkpEweB8lkEEKtnlzYLbSwDioXhu5h+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C4CF80146;
	Thu, 13 Feb 2020 06:57:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031CBF80145; Thu, 13 Feb 2020 06:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,PRX_APP_ATTACH,PRX_APP_IMAGE_JPEG,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-0016b001.pphosted.com (mx0a-0016b001.pphosted.com
 [67.231.148.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA17CF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 06:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA17CF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crestron1.onmicrosoft.com
 header.i=@crestron1.onmicrosoft.com header.b="MwCGaVkA"
Received: from pps.filterd (m0095309.ppops.net [127.0.0.1])
 by mx0a-0016b001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D5fSxt002725
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:16 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0a-0016b001.pphosted.com with ESMTP id 2y1qspgc1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G02fyyQjSY60CywrBec6vW1/vCmP6jQ0QDlRjjVJqgtbp+2oqhD38qXgHlq5cqD9U/s5ytwWnT6MypCD5I1J6vWw/rLZv96QiScp7X8BJYSbDG+pSXeFa8enhHoMvWkLxIPJscGWr+eF+g9BoSGqCVCKfTuKuePNr6OjT2gwl1o5TLTKx1eUb/5Rp3bjl9s+HcctuwaIZD0nMKWIpo8z2Q6A+W5FCasBY/600Pa9jaVZqcyEFAr+H+k73QhjpQTKJ6dmD59ljDQWiwMcO46Yb9uBAIsTwTKUGODpxNoDfOPgt1Sg/NL1hZde6FgRsO9enXLFL0SJJFUuoJ7nyQTTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFvSUyNxf+oweBQ2EdHLCiQfBJ99JB2LbMzkYprmoWA=;
 b=YDzE9JEUJ7ZWg3mh/PaWZWoy9vVfcSSPiFYCGOABOJWY0b4grVhCrONRHcIckg73JPEGtNkjtWSmfiiIuSz81i4pJiSE1YhBDvZlexT1CHF0K52pj/FvbicD+4AYORFZicpVxmVz1AsGCObDghdSr60cG1Pu1R30CCWdkE6x3pyD6fBsIIxq82U8SG63m0pYgmzaNE3A34B6Hn40Cf62iUVjHRX38Cj5PPWBj8P/AKevlcHDsid90dGIVH76ZD3kH+pR+FOBs+EuXuMiHy2bHP3Yu43Fx6rlA80doKb8jn4PnwFj3ErLqtAVEyOpFxWactr8nxl37pCo7zk6htf6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 191.237.4.149) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=crestron.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=crestron.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crestron1.onmicrosoft.com; s=selector1-crestron1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFvSUyNxf+oweBQ2EdHLCiQfBJ99JB2LbMzkYprmoWA=;
 b=MwCGaVkAmx+4Uv7VvDw4ksqnFskmz48RaGgBSNZzAgQGN43Ozx2pc2MpC52pDmU7/UsJh5xxwOJOi2vaYlUUr1m4s766u7EeH9EItWIVPnBCXB8JlAFW5e2YQletEKq1bejrFyrev6BjsOBLiOaxLkGZMOIBKpPmVmGDeTRemR4=
Received: from MWHPR12CA0036.namprd12.prod.outlook.com (2603:10b6:301:2::22)
 by BN8PR12MB3636.namprd12.prod.outlook.com (2603:10b6:408:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Thu, 13 Feb
 2020 05:57:12 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by MWHPR12CA0036.outlook.office365.com
 (2603:10b6:301:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Thu, 13 Feb 2020 05:57:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 crestron.com discourages use of 191.237.4.149 as permitted sender)
Received: from us1.smtp.exclaimer.net (191.237.4.149) by
 CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 05:57:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by us1.smtp.exclaimer.net (191.237.4.149) with Exclaimer Signature Manager
 ESMTP Proxy us1.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 13 Feb 2020 05:57:11 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 17642954
X-ExclaimerImprintLatency: 10117321
X-ExclaimerImprintAction: 491e25b12bfa4e06b30990bfcdfff216
Received: from DM5PR1201MB0233.namprd12.prod.outlook.com (10.174.106.143) by
 DM5PR1201MB0044.namprd12.prod.outlook.com (10.174.106.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 13 Feb 2020 05:57:07 +0000
Received: from DM5PR1201MB0233.namprd12.prod.outlook.com
 ([fe80::89f1:6147:43d1:de8e]) by DM5PR1201MB0233.namprd12.prod.outlook.com
 ([fe80::89f1:6147:43d1:de8e%8]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 05:57:07 +0000
From: Srinivas Pulukuru <spulukuru@crestron.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Welcome to the "Alsa-devel" mailing list
Thread-Index: AQHV4i58gvWLFy/5Xk+BR05EKxpp+KgYmNrg
Date: Thu, 13 Feb 2020 05:57:06 +0000
Message-ID: <DM5PR1201MB023348D36420C7C65760E29BC31A0@DM5PR1201MB0233.namprd12.prod.outlook.com>
References: <mailman.0.1581571721.17635.alsa-devel@alsa-project.org>
In-Reply-To: <mailman.0.1581571721.17635.alsa-devel@alsa-project.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=spulukuru@crestron.com; 
x-originating-ip: [47.190.32.214]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9ba4653e-f418-4049-15ea-08d7b0499171
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0044:|BN8PR12MB3636:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3636D96FAB9AC6AECF689C76C31A0@BN8PR12MB3636.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
x-forefront-prvs: 031257FE13
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(66476007)(66616009)(64756008)(66556008)(66946007)(66446008)(76116006)(33656002)(186003)(2906002)(9686003)(55016002)(53546011)(6506007)(316002)(26005)(6916009)(86362001)(5660300002)(8936002)(81166006)(71200400001)(8676002)(81156014)(966005)(52536014)(478600001)(7696005)(223123001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1201MB0044;
 H:DM5PR1201MB0233.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: crestron.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XpvVfbBiYFVE2Z5HLm4Ic7drXE9DrBfYZAxPmRSAVA5iSOA4OeEFMZe/cUFzW6k3fipkOXUnVJmlwhIOe/Y2JCplq/ev6viORk8j2SZh9hqaQvDhRNYCo9ofi1KUuIqtNLq7jYC8rqtH8Raj483SL7xTGEz/uv6wrElV0GIpxr1/zr23+PNYi6xuZ8Ga/P1yRB7mQeKlGsmtCmeTgN9DJxeQHXbhySXgWPJ9+CjZGxgddaOFKelZVlt2QSV8MD73DhMgTGnv2HXMJrVxKFjbj8RN8fpILpXnSFSEmQt41/2pIaKzXC6O8MNLx/oaCI2UsqjE5uFM6cabKXIXqlg8UrKvMbdcDWBC7gFFVMdfs5eJqKYrq9dhJQ3fnMOvY1b1jt12ngbDBfImRFFH3Oxhuy72N+TPaT4l0/5aIuC+RiU36liYowIn9JwKHw36AhWt3fQd5iKkqlI3NBBjVh69tvFehmFZKW6S2wdrE0ycQDI/8PJTAABxPIpV2jBngW4rzBrQkliLqQSbbX0jG99C3TAg26rlSkn7yL0SK+gOrNx2QjijXeE/CjZoLDMuB9km
x-ms-exchange-antispam-messagedata: n6VdQJUSmhfvmnhHRVIhV5HxdHKySrmCwiYep+J4wU+xpWqa81ck9UPOk0N42o5ZykvelHKX3CC980dRkBHh8Xy6Rua+Qf7ORzy5FNTCXnNo5hraq2QgHYeqHZgp3OnEWADjte4faInD42pffMAcMg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_DM5PR1201MB023348D36420C7C65760E29BC31A0DM5PR1201MB0233_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:191.237.4.149; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(189003)(199004)(26826003)(246002)(235185007)(316002)(26005)(478600001)(86362001)(5660300002)(9686003)(8676002)(2906002)(336012)(66576008)(966005)(21490400003)(70586007)(186003)(8936002)(70206006)(7636002)(356004)(33656002)(52536014)(55016002)(33964004)(6916009)(7596002)(7696005)(53546011)(6506007)(223123001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3636; H:us1.smtp.exclaimer.net; FPR:;
 SPF:SoftFail; LANG:en; PTR:us1.smtp.exclaimer.net; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c80e5906-2fb9-4eb3-5b04-08d7b0498edd
X-Forefront-PRVS: 031257FE13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTkLOGYMS3y1NWvkG/+tcZvsOZsZE9VDz0uH+JNDf82zCnuZlhj4vwCd73OO/l6EPDwYSUXrV/cnJSqPVhAO+znp7ta5BvRyuL22ctUQDODjp85FL/Ppns+U658GFQx7M5m2irX2JFvDgUe9zpXPUQHae+I/yJODKJ/XQ5/wMR4RVdQ1oEtc5yTECl903Du+SH27NHZCCOl2B+2FmWv3RBg0OcH+yQluieiuMY00a5mpkhhDUeLl0wDeLfyukvDYNRBYCF3lJizpQVlFkFVIxm2QgQHnkv1yamFem2WQOy1kmSBLaODJB+wx+UUNI53OXTaI34lA+Cc3e49OTWrnm5AYmBQOD1povoPc3R6GL7qrqtLcy781WD7NxrPkTAx+s8p/5egOEau40IaLkYpRmFkT2jcwLqOALcJXIcbSJSU+U9B9X3f2BjoHkhcIbS3/zTekdH6YVs8Ee88U12oWZKOKbY+AkUsNq+qMR1RVsAQB+PlDBpzgFuZKZSj5nVZfjl8uuiULhLeEJ0rWyOjQuI/CI5xtNxoo7hPwJ9z9eN/oco3xVFo/cgVWqtqpW2KD
X-OriginatorOrg: crestron.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 05:57:10.3704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba4653e-f418-4049-15ea-08d7b0499171
X-MS-Exchange-CrossTenant-Id: eaf12acd-43f1-4359-ab48-2a149174648d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaf12acd-43f1-4359-ab48-2a149174648d; Ip=[191.237.4.149];
 Helo=[us1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3636
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002130045
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] Welcome to the "Alsa-devel" mailing list
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

This is a multi-part message in MIME format.

--_002_DM5PR1201MB023348D36420C7C65760E29BC31A0DM5PR1201MB0233_
Content-Type: multipart/related;
	boundary="----_=_NextPart_f5f1470f-ed13-4966-9f3c-93da415e1289"

------_=_NextPart_f5f1470f-ed13-4966-9f3c-93da415e1289
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is my first post to this mailing list, so apologize for any inconvenie=
nce if this is a wrong place to post such issues. If this is a wrong place =
please forward it to the right mailing list or let me know and I'll repost =
it there.

******************************

I are trying to create a 16 channel shared TDM frame that is shared between=
 8 different playback sources, to be sent out to the default hw:0 card. 

I used dshare plugin for this purpose, please see the attached asound.conf.=
 I tried using the share plugin but the performance is really bad and is no=
t practical for our use given the number of channels that we are using.

when starting the playback the poll function called from snd_pcm_wait_noche=
ck in pcm.c hangs trying to access the /dev/snd/timer and never returns. It=
 is able to access the first couple of times then hangs after that.
=3D=3D> snd_pcm_write_areas =3D=3D> snd_pcm_wait_nocheck =3D=3D> poll()

I see that the snd_pcm_direct_t->spcm->hw.ptr that tracks the frames in tim=
e is stuck and is  not getting incremented in this case.
I have seen several old posts regarding this issue and not sure which versi=
on has this been fixed or it still an issue. I have tried using dmix plugin=
 too with the same result.

My system doesn't have a sound card at the back end of the processor(IMX8M)=
=2E I just need a shared buffer passed to the SAI interface that gets sent =
out of the SAI datalines (I2S) as a TDM frame. The codec drivers have been =
replaced with null terminated codecs as there at no DAC's connected to the =
processor. 

The SAI I2S datalines are connected to a FPGA that demultiplexes and proces=
ses the TDM frame to be sent out to multiple audio outputs.
I am using alsa 1.1.2 and kernel imx8m 4.14.98 . I have tried to move to la=
ter version of alsa that I was able to build. I went till 1.1.7 but I still=
 get the same issue.

I have posted more details in the following link in case you need more deta=
ils including the asound.conf and the batch file that runs 8 different pcm =
files to 8 different virtual sources connected to the same HW card.


https://unix.stackexchange.com/questions/567295/alsa-16-channel-audio-playb=
ack-using-dshare-plugin-is-getting-stuck-at-poll-func

********************************


Thanks,
Srinivas


Srinivas Pulukuru | Sr. Firmware Engineer
Phone: 800-237-2041
Email: spulukuru@crestron.com
Crestron Plano
7250 Dallas Parkway, Suite 600, Plano, Texas 75024
-----Original Message-----
From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of alsa-de=
vel-request@alsa-project.org
Sent: Wednesday, February 12, 2020 11:29 PM
To: Srinivas Pulukuru <spulukuru@crestron.com>
Subject: Welcome to the "Alsa-devel" mailing list

Welcome to the Alsa-devel@alsa-project.org mailing list!

To post to this list, send your message to:

  alsa-devel@alsa-project.org

General information about the mailing list is at:

  https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__mailman.alsa-2Dpro=
ject.org_mailman_listinfo_alsa-2Ddevel&d=3DDwICAg&c=3DBevoquqpKcc6oV2fwHriB=
Q&r=3Dy474ZfoKVIiNc_OxUV2Ln4wICu6ToyX-jLO9EZPQIYc&m=3DVx0KxM09TxM2gCMCtqxgO=
IzQgE-mUpjDjcQ88-UJuuw&s=3DGT-Iz8-BDOiY2gcNqpk7pBIxwCplNg-knesW0kRyLes&e=
=3D 

If you ever want to unsubscribe or change your options (eg, switch to or fr=
om digest mode, change your password, etc.), visit your subscription page a=
t:

  https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__mailman.alsa-2Dpro=
ject.org_mailman_options_alsa-2Ddevel_spulukuru-2540crestron.com&d=3DDwICAg=
&c=3DBevoquqpKcc6oV2fwHriBQ&r=3Dy474ZfoKVIiNc_OxUV2Ln4wICu6ToyX-jLO9EZPQIYc=
&m=3DVx0KxM09TxM2gCMCtqxgOIzQgE-mUpjDjcQ88-UJuuw&s=3Dzi-AR-TccCkIrTRU-67MHr=
lBJBAPgXTEwHT8loM053Q&e=3D 


You can also make such adjustments via email by sending a message to:

  Alsa-devel-request@alsa-project.org

with the word `help' in the subject or body (don't include the quotes), and=
 you will get back a message with instructions.

You must know your password to change your options (including changing the =
password, itself) or to unsubscribe without confirmation.  It is:

  psr9611p

Normally, Mailman will remind you of your alsa-project.org mailing list pas=
swords once every month, although you can disable this if you prefer.  This=
 reminder will also include instructions on how to unsubscribe or change yo=
ur account options.  There is also a button on your options page that will =
email your current password to you.

------_=_NextPart_f5f1470f-ed13-4966-9f3c-93da415e1289
Content-Type: image/jpeg;
	name="image914033.jpg"
Content-Transfer-Encoding: base64
Content-ID: <image914033.jpg@573AB9BA.6AF5D07E>
Content-Description: image914033.jpg
Content-Disposition: inline;
	creation-date="Thu, 13 Feb 2020 05:57:11 +0000";
	filename=image914033.jpg;
	modification-date="Thu, 13 Feb 2020 05:57:11 +0000";
	size=16814

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABaAAD/4QMxaHR0cDov
L25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENl
aGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4
OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzOCA3OS4xNTk4MjQsIDIwMTYvMDkvMTQtMDE6
MDk6MDEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5
OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHht
bG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6
Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUu
Y29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBo
b3Rvc2hvcCBDQyAyMDE3IChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjAw
RjY4QTZGQzA5QjExRTY4QjAxOTMzNjc0MjY2RDMyIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlk
OjAwRjY4QTcwQzA5QjExRTY4QjAxOTMzNjc0MjY2RDMyIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0
UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MDBGNjhBNkRDMDlCMTFFNjhCMDE5MzM2NzQyNjZEMzIi
IHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MDBGNjhBNkVDMDlCMTFFNjhCMDE5MzM2NzQyNjZE
MzIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tl
dCBlbmQ9InIiPz7/4gxYSUNDX1BST0ZJTEUAAQEAAAxITGlubwIQAABtbnRyUkdCIFhZWiAHzgAC
AAkABgAxAABhY3NwTVNGVAAAAABJRUMgc1JHQgAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLUhQICAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFjcHJ0AAABUAAA
ADNkZXNjAAABhAAAAGx3dHB0AAAB8AAAABRia3B0AAACBAAAABRyWFlaAAACGAAAABRnWFlaAAAC
LAAAABRiWFlaAAACQAAAABRkbW5kAAACVAAAAHBkbWRkAAACxAAAAIh2dWVkAAADTAAAAIZ2aWV3
AAAD1AAAACRsdW1pAAAD+AAAABRtZWFzAAAEDAAAACR0ZWNoAAAEMAAAAAxyVFJDAAAEPAAACAxn
VFJDAAAEPAAACAxiVFJDAAAEPAAACAx0ZXh0AAAAAENvcHlyaWdodCAoYykgMTk5OCBIZXdsZXR0
LVBhY2thcmQgQ29tcGFueQAAZGVzYwAAAAAAAAASc1JHQiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAA
ABJzUkdCIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAWFlaIAAAAAAAAPNRAAEAAAABFsxYWVogAAAAAAAAAAAAAAAAAAAAAFhZWiAA
AAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z2Rl
c2MAAAAAAAAAFklFQyBodHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAFklFQyBodHRwOi8vd3d3
LmllYy5jaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABkZXNj
AAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAtIHNSR0IAAAAA
AAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAtIHNSR0IAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAZGVzYwAAAAAAAAAsUmVmZXJlbmNlIFZpZXdpbmcgQ29uZGl0aW9u
IGluIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENvbmRpdGlvbiBp
biBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHZpZXcAAAAAABOk/gAUXy4A
EM8UAAPtzAAEEwsAA1yeAAAAAVhZWiAAAAAAAEwJVgBQAAAAVx/nbWVhcwAAAAAAAAABAAAAAAAA
AAAAAAAAAAAAAAAAAo8AAAACc2lnIAAAAABDUlQgY3VydgAAAAAAAAQAAAAABQAKAA8AFAAZAB4A
IwAoAC0AMgA3ADsAQABFAEoATwBUAFkAXgBjAGgAbQByAHcAfACBAIYAiwCQAJUAmgCfAKQAqQCu
ALIAtwC8AMEAxgDLANAA1QDbAOAA5QDrAPAA9gD7AQEBBwENARMBGQEfASUBKwEyATgBPgFFAUwB
UgFZAWABZwFuAXUBfAGDAYsBkgGaAaEBqQGxAbkBwQHJAdEB2QHhAekB8gH6AgMCDAIUAh0CJgIv
AjgCQQJLAlQCXQJnAnECegKEAo4CmAKiAqwCtgLBAssC1QLgAusC9QMAAwsDFgMhAy0DOANDA08D
WgNmA3IDfgOKA5YDogOuA7oDxwPTA+AD7AP5BAYEEwQgBC0EOwRIBFUEYwRxBH4EjASaBKgEtgTE
BNME4QTwBP4FDQUcBSsFOgVJBVgFZwV3BYYFlgWmBbUFxQXVBeUF9gYGBhYGJwY3BkgGWQZqBnsG
jAadBq8GwAbRBuMG9QcHBxkHKwc9B08HYQd0B4YHmQesB78H0gflB/gICwgfCDIIRghaCG4IggiW
CKoIvgjSCOcI+wkQCSUJOglPCWQJeQmPCaQJugnPCeUJ+woRCicKPQpUCmoKgQqYCq4KxQrcCvML
CwsiCzkLUQtpC4ALmAuwC8gL4Qv5DBIMKgxDDFwMdQyODKcMwAzZDPMNDQ0mDUANWg10DY4NqQ3D
Dd4N+A4TDi4OSQ5kDn8Omw62DtIO7g8JDyUPQQ9eD3oPlg+zD88P7BAJECYQQxBhEH4QmxC5ENcQ
9RETETERTxFtEYwRqhHJEegSBxImEkUSZBKEEqMSwxLjEwMTIxNDE2MTgxOkE8UT5RQGFCcUSRRq
FIsUrRTOFPAVEhU0FVYVeBWbFb0V4BYDFiYWSRZsFo8WshbWFvoXHRdBF2UXiReuF9IX9xgbGEAY
ZRiKGK8Y1Rj6GSAZRRlrGZEZtxndGgQaKhpRGncanhrFGuwbFBs7G2MbihuyG9ocAhwqHFIcexyj
HMwc9R0eHUcdcB2ZHcMd7B4WHkAeah6UHr4e6R8THz4faR+UH78f6iAVIEEgbCCYIMQg8CEcIUgh
dSGhIc4h+yInIlUigiKvIt0jCiM4I2YjlCPCI/AkHyRNJHwkqyTaJQklOCVoJZclxyX3JicmVyaH
Jrcm6CcYJ0kneierJ9woDSg/KHEooijUKQYpOClrKZ0p0CoCKjUqaCqbKs8rAis2K2krnSvRLAUs
OSxuLKIs1y0MLUEtdi2rLeEuFi5MLoIuty7uLyQvWi+RL8cv/jA1MGwwpDDbMRIxSjGCMbox8jIq
MmMymzLUMw0zRjN/M7gz8TQrNGU0njTYNRM1TTWHNcI1/TY3NnI2rjbpNyQ3YDecN9c4FDhQOIw4
yDkFOUI5fzm8Ofk6Njp0OrI67zstO2s7qjvoPCc8ZTykPOM9Ij1hPaE94D4gPmA+oD7gPyE/YT+i
P+JAI0BkQKZA50EpQWpBrEHuQjBCckK1QvdDOkN9Q8BEA0RHRIpEzkUSRVVFmkXeRiJGZ0arRvBH
NUd7R8BIBUhLSJFI10kdSWNJqUnwSjdKfUrESwxLU0uaS+JMKkxyTLpNAk1KTZNN3E4lTm5Ot08A
T0lPk0/dUCdQcVC7UQZRUFGbUeZSMVJ8UsdTE1NfU6pT9lRCVI9U21UoVXVVwlYPVlxWqVb3V0RX
klfgWC9YfVjLWRpZaVm4WgdaVlqmWvVbRVuVW+VcNVyGXNZdJ114XcleGl5sXr1fD19hX7NgBWBX
YKpg/GFPYaJh9WJJYpxi8GNDY5dj62RAZJRk6WU9ZZJl52Y9ZpJm6Gc9Z5Nn6Wg/aJZo7GlDaZpp
8WpIap9q92tPa6dr/2xXbK9tCG1gbbluEm5rbsRvHm94b9FwK3CGcOBxOnGVcfByS3KmcwFzXXO4
dBR0cHTMdSh1hXXhdj52m3b4d1Z3s3gReG54zHkqeYl553pGeqV7BHtje8J8IXyBfOF9QX2hfgF+
Yn7CfyN/hH/lgEeAqIEKgWuBzYIwgpKC9INXg7qEHYSAhOOFR4Wrhg6GcobXhzuHn4gEiGmIzokz
iZmJ/opkisqLMIuWi/yMY4zKjTGNmI3/jmaOzo82j56QBpBukNaRP5GokhGSepLjk02TtpQglIqU
9JVflcmWNJaflwqXdZfgmEyYuJkkmZCZ/JpomtWbQpuvnByciZz3nWSd0p5Anq6fHZ+Ln/qgaaDY
oUehtqImopajBqN2o+akVqTHpTilqaYapoum/adup+CoUqjEqTepqaocqo+rAqt1q+msXKzQrUSt
uK4trqGvFq+LsACwdbDqsWCx1rJLssKzOLOutCW0nLUTtYq2AbZ5tvC3aLfguFm40blKucK6O7q1
uy67p7whvJu9Fb2Pvgq+hL7/v3q/9cBwwOzBZ8Hjwl/C28NYw9TEUcTOxUvFyMZGxsPHQce/yD3I
vMk6ybnKOMq3yzbLtsw1zLXNNc21zjbOts83z7jQOdC60TzRvtI/0sHTRNPG1EnUy9VO1dHWVdbY
11zX4Nhk2OjZbNnx2nba+9uA3AXcit0Q3ZbeHN6i3ynfr+A24L3hROHM4lPi2+Nj4+vkc+T85YTm
DeaW5x/nqegy6LzpRunQ6lvq5etw6/vshu0R7ZzuKO6070DvzPBY8OXxcvH/8ozzGfOn9DT0wvVQ
9d72bfb794r4Gfio+Tj5x/pX+uf7d/wH/Jj9Kf26/kv+3P9t////7gAmQWRvYmUAZMAAAAABAwAV
BAMGCg0AABr3AAApegAAM2EAAEGs/9sAhAABAQEBAQEBAQEBAgEBAQICAgEBAgICAgICAgICAwID
AwMDAgMDBAQEBAQDBQUFBQUFBwcHBwcICAgICAgICAgIAQEBAQICAgUDAwUHBQQFBwgICAgICAgI
CAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/wgARCAAwAToDAREAAhEB
AxEB/8QA+gAAAgICAwEBAAAAAAAAAAAAAAgHCQUGAgMKBAEBAAIDAQEBAQAAAAAAAAAAAAAGBAUH
AwECCBAAAAYCAQMDBQEBAAAAAAAAAQIDBAUGAAcSERYIExUYECBQFCQhFxEAAQMCBAIEBwsKBgMA
AAAAAgEDBBEFACESBjETQVFhFHGBIjJCFQeRobFSgqIjQ9M0lBBiktIzU2MkJRYgUMGykzZyc6MS
AAIBAgQDBQcFAQAAAAAAAAABESECMUFREhAiMmFxgQMjIFCRscHRovCh8UJSExMBAAIBAwMCBwEB
AAAAAAAAAQARITFBYVFxkYGhEPCxwdHh8SBQ/9oADAMBAAIRAxEAAAG/wAAAPg+/iOp0DeYczN8u
wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEL2tTVdoecQTcU2S59OZ7GE+udRVbbeM00/O8e0cToC
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

------_=_NextPart_f5f1470f-ed13-4966-9f3c-93da415e1289--

--_002_DM5PR1201MB023348D36420C7C65760E29BC31A0DM5PR1201MB0233_
Content-Type: application/octet-stream; name="asound.conf"
Content-Description: asound.conf
Content-Disposition: attachment; filename="asound.conf"; size=3980;
	creation-date="Sat, 08 Feb 2020 05:39:33 GMT";
	modification-date="Sat, 08 Feb 2020 05:39:33 GMT"
Content-Transfer-Encoding: base64

IyBDcmVzdHJvbiBETkFfQVVESU8geCBzcGVjaWZpYyBjb25maWd1cmF0aW9ucwojIE5PVEU6IHRo
aXMgaXMgZm9yIHNoYXJpbmcgbXVsdGlwbGUgY2hhbm5lbHMgb24gYSBzaW5nbGUgKFRETSkgYXVk
aW8gZGV2aWNlIHdpdGggbXVsdHBsZSBBTFNBIGNsaWVudHMKCiMgc2hhcmVkIGJ1ZmZlciBmb3Ig
cGxheWJhY2sKcGNtX3NsYXZlLnRkbXNoYXJlIHsKICAgIHBjbSAiaHc6MCIKICAgIGNoYW5uZWxz
IDE2CiAgICByYXRlIDQ4MDAwICAgICAgICAgICMgZml4ZWQsIGJlY2F1c2UgYWxsIGRzaGFyZSBk
ZXZpY2VzIG11c3QgdXNlIHRoZSBzYW1lIHNhbXBsZXJhdGUuCiAgICBmb3JtYXQgUzI0X0xFCiAg
ICBwZXJpb2Rfc2l6ZSAxMDI0CiAgICBidWZmZXJfc2l6ZSA4MTkyCn0KCiMgc3JjMSBzaGFyZWQg
cGNtIGRldmljZSBhbmQgY29ycmVzcG9uZGluZyB2aXJ0dWFsIHBsYXliYWNrIGRldmljZQpwY20u
c3JjMV9kc2hhcmUgewogICAgdHlwZSBkc2hhcmUKICAgIGlwY19rZXkgNDM1NDQ1NTMKICAgIHNs
YXZlIHRkbXNoYXJlCiAgICBiaW5kaW5ncy4wIDAKICAgIGJpbmRpbmdzLjEgNAp9CnBjbS5zcmMx
IHsKICAgIHR5cGUgcGx1ZwogICAgc2xhdmUucGNtICJzcmMxX2RzaGFyZSIKIGhpbnQgewogICAg
ICAgICAgICAgICAgc2hvdyB7CiAgICAgICAgICAgICAgICAgICAgICAgIEBmdW5jIHJlZmVyCiAg
ICAgICAgICAgICAgICAgICAgICAgIG5hbWUgZGVmYXVsdHMubmFtZWhpbnQuYmFzaWMKICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uICJURE0gMCBjaGFubmVsIDAv
MSBmb3IgYXVkaW8gcGxheWJhY2siCiAgICAgICAgfQp9CgojIHNyYzIgc2hhcmVkIHBjbSBkZXZp
Y2UgYW5kIGNvcnJlc3BvbmRpbmcgdmlydHVhbCBwbGF5YmFjayBkZXZpY2UKcGNtLnNyYzJfZHNo
YXJlIHsKICAgIHR5cGUgZHNoYXJlCiAgICBpcGNfa2V5IDQzNTQ0NTUzCiAgICBzbGF2ZSB0ZG1z
aGFyZQogICAgYmluZGluZ3MuMCA4CiAgICBiaW5kaW5ncy4xIDEyCn0KcGNtLnNyYzIgewogICAg
dHlwZSBwbHVnCiAgICBzbGF2ZS5wY20gInNyYzJfZHNoYXJlIgogaGludCB7CiAgICAgICAgICAg
ICAgICBzaG93IHsKICAgICAgICAgICAgICAgICAgICAgICAgQGZ1bmMgcmVmZXIKICAgICAgICAg
ICAgICAgICAgICAgICAgbmFtZSBkZWZhdWx0cy5uYW1laGludC5iYXNpYwogICAgICAgICAgICAg
ICAgfQogICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gIlRETSAxIGNoYW5uZWwgMi8zIGZvciBh
dWRpbyBwbGF5YmFjayIKICAgICAgICB9Cn0KCiMgc3JjMyBzaGFyZWQgcGNtIGRldmljZSBhbmQg
Y29ycmVzcG9uZGluZyB2aXJ0dWFsIHBsYXliYWNrIGRldmljZQpwY20uc3JjM19kc2hhcmUgewog
ICAgdHlwZSBkc2hhcmUKICAgIGlwY19rZXkgNDM1NDQ1NTMKICAgIHNsYXZlIHRkbXNoYXJlCiAg
ICBiaW5kaW5ncy4wIDEKICAgIGJpbmRpbmdzLjEgNQp9CnBjbS5zcmMzIHsKICAgIHR5cGUgcGx1
ZwogICAgc2xhdmUucGNtICJzcmMzX2RzaGFyZSIKIGhpbnQgewogICAgICAgICAgICAgICAgc2hv
dyB7CiAgICAgICAgICAgICAgICAgICAgICAgIEBmdW5jIHJlZmVyCiAgICAgICAgICAgICAgICAg
ICAgICAgIG5hbWUgZGVmYXVsdHMubmFtZWhpbnQuYmFzaWMKICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgICAgIGRlc2NyaXB0aW9uICJURE0gMiBjaGFubmVsIDQvNSBmb3IgYXVkaW8gcGxh
eWJhY2siCiAgICAgICAgfQp9CgojIHNyYzQgc2hhcmVkIHBjbSBkZXZpY2UgYW5kIGNvcnJlc3Bv
bmRpbmcgdmlydHVhbCBwbGF5YmFjayBkZXZpY2UKcGNtLnNyYzRfZHNoYXJlIHsKICAgIHR5cGUg
ZHNoYXJlCiAgICBpcGNfa2V5IDQzNTQ0NTUzCiAgICBzbGF2ZSB0ZG1zaGFyZQogICAgYmluZGlu
Z3MuMCA5CiAgICBiaW5kaW5ncy4xIDEzCn0KcGNtLnNyYzQgewogICAgdHlwZSBwbHVnCiAgICBz
bGF2ZS5wY20gInNyYzRfZHNoYXJlIgogaGludCB7CiAgICAgICAgICAgICAgICBzaG93IHsKICAg
ICAgICAgICAgICAgICAgICAgICAgQGZ1bmMgcmVmZXIKICAgICAgICAgICAgICAgICAgICAgICAg
bmFtZSBkZWZhdWx0cy5uYW1laGludC5iYXNpYwogICAgICAgICAgICAgICAgfQogICAgICAgICAg
ICAgICAgZGVzY3JpcHRpb24gIlRETSAzIGNoYW5uZWwgNi83IGZvciBhdWRpbyBwbGF5YmFjayIK
ICAgICAgICB9Cn0KCiMgc3JjNSBzaGFyZWQgcGNtIGRldmljZSBhbmQgY29ycmVzcG9uZGluZyB2
aXJ0dWFsIHBsYXliYWNrIGRldmljZQpwY20uc3JjNV9kc2hhcmUgewogICAgdHlwZSBkc2hhcmUK
ICAgIGlwY19rZXkgNDM1NDQ1NTMKICAgIHNsYXZlIHRkbXNoYXJlCiAgICBiaW5kaW5ncy4wIDIK
ICAgIGJpbmRpbmdzLjEgNgp9CnBjbS5zcmM1IHsKICAgIHR5cGUgcGx1ZwogICAgc2xhdmUucGNt
ICJzcmM1X2RzaGFyZSIKIGhpbnQgewogICAgICAgICAgICAgICAgc2hvdyB7CiAgICAgICAgICAg
ICAgICAgICAgICAgIEBmdW5jIHJlZmVyCiAgICAgICAgICAgICAgICAgICAgICAgIG5hbWUgZGVm
YXVsdHMubmFtZWhpbnQuYmFzaWMKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGRl
c2NyaXB0aW9uICJURE0gNCBjaGFubmVsIDgvOSBmb3IgYXVkaW8gcGxheWJhY2siCiAgICAgICAg
fQp9CgojIHNyYzYgc2hhcmVkIHBjbSBkZXZpY2UgYW5kIGNvcnJlc3BvbmRpbmcgdmlydHVhbCBw
bGF5YmFjayBkZXZpY2UKcGNtLnNyYzZfZHNoYXJlIHsKICAgIHR5cGUgZHNoYXJlCiAgICBpcGNf
a2V5IDQzNTQ0NTUzCiAgICBzbGF2ZSB0ZG1zaGFyZQogICAgYmluZGluZ3MuMCAxMAogICAgYmlu
ZGluZ3MuMSAxNAp9CnBjbS5zcmM2IHsKICAgIHR5cGUgcGx1ZwogICAgc2xhdmUucGNtICJzcmM2
X2RzaGFyZSIKIGhpbnQgewogICAgICAgICAgICAgICAgc2hvdyB7CiAgICAgICAgICAgICAgICAg
ICAgICAgIEBmdW5jIHJlZmVyCiAgICAgICAgICAgICAgICAgICAgICAgIG5hbWUgZGVmYXVsdHMu
bmFtZWhpbnQuYmFzaWMKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIGRlc2NyaXB0
aW9uICJURE0gNWNoYW5uZWwgMTAvMTEgZm9yIGF1ZGlvIHBsYXliYWNrIgogICAgICAgIH0KfQoK
IyBzcmM3IHNoYXJlZCBwY20gZGV2aWNlIGFuZCBjb3JyZXNwb25kaW5nIHZpcnR1YWwgcGxheWJh
Y2sgZGV2aWNlCnBjbS5zcmM3X2RzaGFyZSB7CiAgICB0eXBlIGRzaGFyZQogICAgaXBjX2tleSA0
MzU0NDU1MwogICAgc2xhdmUgdGRtc2hhcmUKICAgIGJpbmRpbmdzLjAgMwogICAgYmluZGluZ3Mu
MSA3Cn0KcGNtLnNyYzcgewogICAgdHlwZSBwbHVnCiAgICBzbGF2ZS5wY20gInNyYzdfZHNoYXJl
IgogaGludCB7CiAgICAgICAgICAgICAgICBzaG93IHsKICAgICAgICAgICAgICAgICAgICAgICAg
QGZ1bmMgcmVmZXIKICAgICAgICAgICAgICAgICAgICAgICAgbmFtZSBkZWZhdWx0cy5uYW1laGlu
dC5iYXNpYwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gIlRE
TSA2IGNoYW5uZWwgMTIvMTMgZm9yIGF1ZGlvIHBsYXliYWNrIgogICAgICAgIH0KfQoKIyBzcmM4
IHNoYXJlZCBwY20gZGV2aWNlIGFuZCBjb3JyZXNwb25kaW5nIHZpcnR1YWwgcGxheWJhY2sgZGV2
aWNlCnBjbS5zcmM4X2RzaGFyZSB7CiAgICB0eXBlIGRzaGFyZQogICAgaXBjX2tleSA0MzU0NDU1
MwogICAgc2xhdmUgdGRtc2hhcmUKICAgIGJpbmRpbmdzLjAgMTEKICAgIGJpbmRpbmdzLjEgMTUK
fQpwY20uc3JjOCB7CiAgICB0eXBlIHBsdWcKICAgIHNsYXZlLnBjbSAic3JjOF9kc2hhcmUiCiBo
aW50IHsKICAgICAgICAgICAgICAgIHNob3cgewogICAgICAgICAgICAgICAgICAgICAgICBAZnVu
YyByZWZlcgogICAgICAgICAgICAgICAgICAgICAgICBuYW1lIGRlZmF1bHRzLm5hbWVoaW50LmJh
c2ljCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAiVERNIDcg
Y2hhbm5lbCAxNC8xNSBmb3IgYXVkaW8gcGxheWJhY2siCiAgICAgICAgfQp9Cgo=

--_002_DM5PR1201MB023348D36420C7C65760E29BC31A0DM5PR1201MB0233_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_DM5PR1201MB023348D36420C7C65760E29BC31A0DM5PR1201MB0233_--
