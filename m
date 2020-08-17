Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFB246354
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B2716D4;
	Mon, 17 Aug 2020 11:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B2716D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656458;
	bh=nx0nHPVvf60VCCzsnfR8PAS45q6iG28ZbWpQAZ6IQdk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0yYHTAJYrij1XU6woIcZWfd4Fx69N2thDJhTOvM6QcbNwh+f5ypn5vDIoe+9N28y
	 gjOzB0RMjokc8+QbjqzrYkyPMVu2Ge6nWGDztoyZT4AYpYKIxw5E1uS6BXT1exKkGZ
	 XZC0N7jxyTIJwxwWhuHQV0CUVt2+Y/Ihwxw9H7qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F36F802C4;
	Mon, 17 Aug 2020 11:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A0AF802C3; Mon, 17 Aug 2020 11:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,PRX_APP_ATTACH,SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::610])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D168F80216
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 11:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D168F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="P7pkDugI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9npTKCOHsq5z+RF4d8q181Kf/NF4/ddKO4wdQz8xyRd0vAAlHOUCBPETF6tnwxvGpFauTsKons/zbE+XKgxaYc5Pz1MID0Tcw3HLU1qvA3k7w/1y3gqajQBCEQV73LnSo40ik7GVzusWJ/iIAf1UDxCH5l6goXKecH3yYHaSw9s7z/My+1qrDOYzK1ZTYk7QVCdUoUxIWMk6QKu6Hydwn6TL60be7s3A0gR5+oYXtBiNPyUqOIegT1fiKulnJDeyJBwePSAEpV30E4IrEwFuHmdgTL8cB+yYsT6J7FHzRluwyTyuxJhy3WSH+wC6qg4EctaRDcFrCye+daTnOMLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH57Pw3qEUvKem3yPOduY5AqbEsDkp1sdaySsVBn8qs=;
 b=F1MP70JvYDvJdI2y+ghvu0WmjU8eTW9V08DgyJD05fHs8y1kbMk3qC0DIJZkhFsdl8dc2gqu4S6V5JlFYxHR4uGkgyQAeIg4bvG9y1R1J0pkRjSl+4GF8/UW0TCPM2OnvTlMuSOiSHkL2DkUrZLkLYMVec1FJI37yk5YaTh+AFj1K8XDI6Z/v6cljzbnnagKq+uKfhUt7v46xQRu1pkAh3nG+7bxLqhpE12DrJPT4HzArZIotCES3i3HVC9SRgShkW+r11/aNz4KsjU/tkQ7ymf/O8amt6FZ0Jf8oV0V4F/1fgqeFaWGrGnZCNWcNK9UPxxOXAZf0+vEHc14zg53Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH57Pw3qEUvKem3yPOduY5AqbEsDkp1sdaySsVBn8qs=;
 b=P7pkDugIzxvEeQuVe7mIbHS2i3DmreaeTHDiKJdWIxKtFsMr1yNOnrOK/LWh11ot8qJS5ZmCSWNvmWcZ1TgUu7JAn/ivgp+W3evXyrCklR90UxLBSEpZjiXCFWRz+8pyIQJKxKUkXiPJpCGp6IBleBpGbTWEQ4m57vhWD4iqiAI=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.21; Mon, 17 Aug
 2020 09:22:46 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950%3]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 09:22:46 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQbD9eqMlwY2U27XyctTVPmVak3Rd/wgASnXICAAByKsA==
Date: Mon, 17 Aug 2020 09:22:46 +0000
Message-ID: <VE1PR04MB6638AC2A3AE852C3047E7B97895F0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
In-Reply-To: <61498763c60e488a825e8dd270732b62@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae882f21-0706-4b67-0921-08d8428f1a7d
x-ms-traffictypediagnostic: VE1PR04MB6640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6640C8B77AD16A0F4C658F8C895F0@VE1PR04MB6640.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hjwg2kdh4W2rUPvzfSiMWX1XEtS1t1n00Epd1oSYBK0cy5EhHZ9c38D5AZJhajVAc+v53PYRTasVNT7ySHa9F1Y0bTfgqoiPTxrH8eZhsJos7swXPBwSJWgOGmuC1f8T1WBv4sEYWhgw4dY5BIaC6FA1bz1NFqXuOR3qP0ySc/tFyRcyY2T2sa5MBPTIhxMIuKP3pd+MHMsf/Iz6Jvi1LKZ8KOn7DVEH/I3LnJgvnu5MRwYQJcjSY4g5oIo3RG+AmjfI42EpkRY6+MMxrX2wVJMSD4r9Bs6DDmQIxl7UIIeOWErTFjuMIs0inh6utt+PYeZtnDghLJ04a1EDkt3WM6uLNGF2GKuvIDl+gYaQ/HYF5YjsaOBoJjWSDHhDv6Qv8P4oyA96x1nb3G7HdsoVVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(7696005)(4326008)(26005)(6506007)(53546011)(6916009)(71200400001)(9686003)(54906003)(966005)(52536014)(316002)(478600001)(55016002)(186003)(8936002)(66556008)(66616009)(64756008)(7416002)(83380400001)(86362001)(8676002)(66446008)(2906002)(33656002)(76116006)(5660300002)(99936003)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lsHFq1fz4NXHS93n/0B+DMmwxowDWjq3AjdAn9eszXyG/AiiNzAtetGiP0jBNH386cPkUZTN7G+mgGwr2f9wBYzoZepeU7My4Uv08OZKqSN+yauHcPKYshAOK8gH6176mBTyE5ZJiv/cjcjjZp0mZvgf3yLWNhAC0/QssnmbIr8cd+4wy4KS7E7TfW4g8I6nQwyiR7g6FiTIe1e0eKM5RcE3D6HObXlI0/NNxoaNH+OcPQ/iMVX7Ls2m8S2RLKD+9ew83g9qm/hCeR14dYwJPoTQdJpYJQvvdhduLXigAVKxfG7nO+bhVjsrsgjn0Pu4rxCKJJekLT5WE+vrwDXV6U/yC9QdlguVP4zUNXslHT1uUFEcNJsbj+asbgEdWfuLH8wno9iApMcTll3vLZ2QCilPdhMHdMzqUtRh8+b4pbYsZcjOL8UIvQNODEfyiKpJUwVsNcMKNOmrPp6L3UVd7fVoKDGV9AEgDmVicS9YD8jMydPre8Yi+rIlQ65zqFi5Dc3dJSSS8ta+1HWvKXeIyn+x2uA0LEtO0Zfm0627p9WBjp7r7W8tbEsGvJz3vCmnhzH64iOaLCsgpmAk3on2pq9VGn2qOhnQq7NTtIaa10ZNCVWEfpATqAEKFoiSE1tc1S128umpMKbgFqjfuntsjA==
Content-Type: multipart/mixed;
 boundary="_002_VE1PR04MB6638AC2A3AE852C3047E7B97895F0VE1PR04MB6638eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae882f21-0706-4b67-0921-08d8428f1a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 09:22:46.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uigWG9bdha/ORPQfPsjDu/rp8pqWxfRCv3PQEwvBgnOA2UXdGVMBaD46yesOKG8riWS5MfFX7FqRGNi4d/bMGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

--_002_VE1PR04MB6638AC2A3AE852C3047E7B97895F0VE1PR04MB6638eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020/08/17 15:29 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com> wro=
te:
> We think this is not an i.MX6-specific problem, but a problem of the
> DMAengine usage from the PCM.
> In case of a XRUN, the DMA channel is never closed but first a
> SNDRV_PCM_TRIGGER_STOP next a SNDRV_PCM_TRIGGER_START is triggered.
> The SNDRV_PCM_TRIGGER_STOP simply executes a
> dmaengine_terminate_async() [1] but does not await the termination by cal=
ling
> dmaengine_synchronize(), which is required as stated by the docu [2].
> Anyways, we are not able to fix it in the pcm_dmaengine layer either at t=
he
> end of SNDRV_PCM_TRIGGER_STOP (called from the DMA on complete
> interrupt handler) or at the beginning of SNDRV_PCM_TRIGGER_START (called
> from a PCM ioctl), since the dmaengine_synchronize() requires a non-atomi=
c
> context.
>=20
> Based on my understanding, most of the DMA implementations don't even
> implement device_synchronize and if they do, it might not really be neces=
sary
> since the terminate_all operation is synchron.
>=20
> With the i.MX6, it looks a bit different:
> Since [4], the terminate_all operation really schedules a worker which wa=
its
> the required ~1ms and then does the context freeing.
> Now, the ioctl(SNDRV_PCM_IOCTL_PREPARE) and the following
> ioctl(SNDRV_PCM_IOCTL_READI_FRAMES),
> which are called from US to handle/recover from a XRUN, are in a race wit=
h the
> terminate_worker.
> If the terminate_worker finishes earlier, everything is fine.
> Otherwise, the sdma_prep_dma_cyclic() is called, sets up everything and a=
s
> soon as it is scheduled out to wait for data, the terminate_worker is sch=
eduled
> and kills it.
> In this case, we wait in [5] until the timeout is reached and return with=
 -EIO.
>=20
> Based on our understanding, there exist two different fixing approaches:
> We thought that the pcm_dmaengine should handle this by either
> synchronizing the DMA on a trigger or terminating it synchronously.
> However, as we are in an atomic context, we either have to give up the at=
omic
> context of the PCM to finish the termination or we have to design a
> synchronous terminate variant which is callable from an atomic context.
>=20
> For the first option, which is potentially more performant, we have to le=
ave the
> atomic PCM context and we are not sure if we are allowed to.
> For the second option, we would have to divide the dma_device terminate_a=
ll
> into an atomic sync and an async one, which would align with the dmaengin=
e
> API, giving it the option to ensure termination in an atomic context.
> Based on my understanding, most of them are synchronous anyways, for the
> currently async ones we would have to implement busy waits.
> However, with this approach, we reach the WARN_ON [6] inside of an atomic
> context, indicating we might not do the right thing.
>=20
> Ad Failure Log (at bottom):
> I haven't added the ioctl syscalls, but this is basically the output with=
 additional
> prints to be able to follow the code execution path.
> A XRUN (buffer size is 480 but 960 available) leads to a
> SNDRV_PCM_TRIGGER_STOP.
> This leads to terminate_async, starting the terminate_worker.
> Next, the XRUN recovery triggers SNDRV_PCM_TRIGGER_START, calling
> sdma_prep_dma_cyclic and then waits for the DMA in wait_for_avail().
> Next we see the two freeings, first the old, then the newly added one; so=
 the
> terminate_worker is back at work.
> Now the DMA is terminated, while we are still waiting on data from it.
>=20
> What do you think about it? Is any of the provided solutions practicable?
> If you need further information or additional logging, feel free to ask.
busy_wait is not good I think, would you please have a try with the attache=
d patch
which is based on https://lkml.org/lkml/2020/8/11/111? The basic idea is
to keep the freed descriptor into another list for freeing in later termina=
te_worker
instead of freeing directly all in terminate_worker by vchan_get_all_descri=
ptors
which may break next descriptor coming soon


--_002_VE1PR04MB6638AC2A3AE852C3047E7B97895F0VE1PR04MB6638eurp_
Content-Type: application/octet-stream;
	name="0001-dmaengine-imx-sdma-add-terminated-list-for-freed-des.patch"
Content-Description:  0001-dmaengine-imx-sdma-add-terminated-list-for-freed-des.patch
Content-Disposition: attachment;
	filename="0001-dmaengine-imx-sdma-add-terminated-list-for-freed-des.patch";
	size=2732; creation-date="Mon, 17 Aug 2020 09:15:08 GMT";
	modification-date="Mon, 17 Aug 2020 09:15:08 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzMWE2YmQ2Y2I3NDNmYzEwNzQwODdkZWE4NTE1MjlkYTQ4N2E5NTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JpbiBHb25nIDx5aWJpbi5nb25nQG54cC5jb20+CkRhdGU6
IFNhdCwgMTUgQXVnIDIwMjAgMDA6MjE6MTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBkbWFlbmdp
bmU6IGlteC1zZG1hOiBhZGQgdGVybWluYXRlZCBsaXN0IGZvciBmcmVlZCBkZXNjcmlwdG9yCiBp
biB3b3JrZXIKCkFkZCB0ZXJtaW5hdGVkIGxpc3QgZm9yIGtlZXBpbmcgZGVzY3JpcHRvciBzbyB0
aGF0IGl0IGNvdWxkIGJlIGZyZWVkIGluCndvcmtlciB3aXRob3V0IGFueSBwb3RlbnRpYWwgaW52
b2x2aW5nIG5leHQgZGVzY3JpcHRvciByYWlzZWQgdXAgYmVmb3JlCnRoaXMgZGVzY3JpcHRvciBm
cmVlZCwgYmVjYXVzZSB2Y2hhbl9nZXRfYWxsX2Rlc2NyaXB0b3JzIGdldCBhbGwKZGVzY3JpcHRv
cnMgaW5jbHVkaW5nIHRoZSBsYXN0IHRlcm1pbmF0ZWQgZGVzY3JpcHRvciBhbmQgdGhlIG5leHQK
ZGVzY3JpcHRvciwgaGVuY2UsIHRoZSBuZXh0IGRlc2NyaXB0b3IgbWF5YmUgZnJlZWQgdW5leHBl
Y3RseSB3aGVuIGl0J3MKZG9uZSBpbiB3b3JrZXIgd2l0aG91dCB0aGlzIHBhdGNoLgoKU2lnbmVk
LW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPgotLS0KIGRyaXZlcnMvZG1h
L2lteC1zZG1hLmMgfCAxNyArKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvaW14
LXNkbWEuYyBiL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMKaW5kZXggMTYzMTI0Mi4uOWI5MDVmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9kbWEvaW14LXNkbWEuYworKysgYi9kcml2ZXJzL2RtYS9pbXgt
c2RtYS5jCkBAIC0zNzksNiArMzc5LDcgQEAgc3RydWN0IHNkbWFfY2hhbm5lbCB7CiAJZW51bSBk
bWFfc3RhdHVzCQkJc3RhdHVzOwogCXN0cnVjdCBpbXhfZG1hX2RhdGEJCWRhdGE7CiAJc3RydWN0
IHdvcmtfc3RydWN0CQl0ZXJtaW5hdGVfd29ya2VyOworCXN0cnVjdCBsaXN0X2hlYWQgICAgICAg
ICAgICAgICAgdGVybWluYXRlZDsKIAlib29sCQkJCWlzX3JhbV9zY3JpcHQ7CiB9OwogCkBAIC0x
MDc0LDkgKzEwNzUsNiBAQCBzdGF0aWMgdm9pZCBzZG1hX2NoYW5uZWxfdGVybWluYXRlX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewogCXN0cnVjdCBzZG1hX2NoYW5uZWwgKnNkbWFj
ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBzZG1hX2NoYW5uZWwsCiAJCQkJCQkgIHRlcm1p
bmF0ZV93b3JrZXIpOwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0JTElTVF9IRUFEKGhlYWQpOwot
CiAJLyoKIAkgKiBBY2NvcmRpbmcgdG8gTlhQIFImRCB0ZWFtIGEgZGVsYXkgb2Ygb25lIEJEIFNE
TUEgY29zdCB0aW1lCiAJICogKG1heGltdW0gaXMgMW1zKSBzaG91bGQgYmUgYWRkZWQgYWZ0ZXIg
ZGlzYWJsZSBvZiB0aGUgY2hhbm5lbApAQCAtMTA4NSwxMCArMTA4Myw3IEBAIHN0YXRpYyB2b2lk
IHNkbWFfY2hhbm5lbF90ZXJtaW5hdGVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJ
ICovCiAJdXNsZWVwX3JhbmdlKDEwMDAsIDIwMDApOwogCi0Jc3Bpbl9sb2NrX2lycXNhdmUoJnNk
bWFjLT52Yy5sb2NrLCBmbGFncyk7Ci0JdmNoYW5fZ2V0X2FsbF9kZXNjcmlwdG9ycygmc2RtYWMt
PnZjLCAmaGVhZCk7Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2RtYWMtPnZjLmxvY2ssIGZs
YWdzKTsKLQl2Y2hhbl9kbWFfZGVzY19mcmVlX2xpc3QoJnNkbWFjLT52YywgJmhlYWQpOworCXZj
aGFuX2RtYV9kZXNjX2ZyZWVfbGlzdCgmc2RtYWMtPnZjLCAmc2RtYWMtPnRlcm1pbmF0ZWQpOwog
fQogCiBzdGF0aWMgaW50IHNkbWFfdGVybWluYXRlX2FsbChzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4p
CkBAIC0xMTAyLDYgKzEwOTcsMTMgQEAgc3RhdGljIGludCBzZG1hX3Rlcm1pbmF0ZV9hbGwoc3Ry
dWN0IGRtYV9jaGFuICpjaGFuKQogCiAJaWYgKHNkbWFjLT5kZXNjKSB7CiAJCXZjaGFuX3Rlcm1p
bmF0ZV92ZGVzYygmc2RtYWMtPmRlc2MtPnZkKTsKKwkJLyoKKwkJICogbW92ZSBvdXQgY3VycmVu
dCBkZXNjcmlwdG9yIGludG8gdGVybWluYXRlZCBsaXN0IHNvIHRoYXQKKwkJICogaXQgY291bGQg
YmUgZnJlZSBpbiBzZG1hX2NoYW5uZWxfdGVybWluYXRlX3dvcmsgYWxvbmUKKwkJICogbGF0ZXIg
d2l0aG91dCBwb3RlbnRpYWwgaW52b2x2aW5nIG5leHQgZGVzY3JpcHRvciByYWlzZWQKKwkJICog
dXAgYmVmb3JlIHRoZSBsYXN0IGRlc2NyaXB0b3IgdGVybWluYXRlZC4KKwkJICovCisJCXZjaGFu
X2dldF9hbGxfZGVzY3JpcHRvcnMoJnNkbWFjLT52YywgJnNkbWFjLT50ZXJtaW5hdGVkKTsKIAkJ
c2RtYWMtPmRlc2MgPSBOVUxMOwogCQlzY2hlZHVsZV93b3JrKCZzZG1hYy0+dGVybWluYXRlX3dv
cmtlcik7CiAJfQpAQCAtMjEyMiw2ICsyMTI0LDcgQEAgc3RhdGljIGludCBzZG1hX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkJc2RtYWMtPmNoYW5uZWwgPSBpOwogCQlz
ZG1hYy0+dmMuZGVzY19mcmVlID0gc2RtYV9kZXNjX2ZyZWU7CisJCUlOSVRfTElTVF9IRUFEKCZz
ZG1hYy0+dGVybWluYXRlZCk7CiAJCUlOSVRfV09SSygmc2RtYWMtPnRlcm1pbmF0ZV93b3JrZXIs
CiAJCQkJc2RtYV9jaGFubmVsX3Rlcm1pbmF0ZV93b3JrKTsKIAkJLyoKLS0gCjIuNy40Cgo=

--_002_VE1PR04MB6638AC2A3AE852C3047E7B97895F0VE1PR04MB6638eurp_--
