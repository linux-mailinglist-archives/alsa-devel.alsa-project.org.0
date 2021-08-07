Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C353E3263
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 02:42:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D4416DF;
	Sat,  7 Aug 2021 02:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D4416DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628296968;
	bh=0pv9wAKkb86U8I1j4mVqDj+zecpF3OTzAPSgvDopJNw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r7bYxrdhJBKhHvUcCRMDppzaC+ED5fbkUYmoLWUF5OmDdcsuZIsY5736RTdJBJv3i
	 i2EvlnTiK4SbLItVr9oMEMXGY0qNXNhOgcPoQRgbare5dwZerRzfMOfhd8l7nxMdUf
	 gXAiQ8g8YQYGLKPQeLbODDXf68xEdhvbNgyWXKfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748B8F80268;
	Sat,  7 Aug 2021 02:41:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 751CCF8025F; Sat,  7 Aug 2021 02:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E55F0F8010A
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 02:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E55F0F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cissecurity.onmicrosoft.com
 header.i=@cissecurity.onmicrosoft.com header.b="AN+PX/yA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gU5vpgavtOLMZJE1gjwESRhKZV9pj39Dv4/VpGpQNfiZwTecQJuduLiN3cNzamFCRzNv3fTehbTvnzJFRRQD5BFDhwJRCnOBA2+UqPBwR6X7Eug3QgwlLkt8vls+q9c8xwBHWxgDkjAwdWZJWDw+kSEzv6tkGAtPlI36YxZVfE5gyqvv0rWru6a/oAUpRyHIO9hn28elCnmT9uIYqNXCNxiNLnWmI0QlJyaEkGAn2x7VyEMMTVvNeBTlU13lUVhQdI2bEhELJJN5URblRDqXaI3dvcgAuHAhNJ3j7AKMuai4U8JBl1Iami3TymAQbi4XstneOt0eutEBJkYH4E+T6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18pSfcjbA7zIH8gFLB1ZgzkhQm5O0PTL2YySpDAKJ0g=;
 b=Lt6SouPMzCqjGFfDKQS28sYYXQFTyPyBCGVk/+GljDHeybYEMyBkUTPtN1fpgIGxSwCoo7GtfTTu7kKgtjE0eQYUAeNh7HYmnsLKYXI2yJ0GDoAGrq8dfuC6DuFxinkF4Qf0DGXvLC9L3u/jbpmNcUY8+algR+/oXGXZ45p7rExr93EPW5hyLb2J46CeT/XvlTnCW2YAzRPFOoADhW8CGofDEAQavJdO5ef01IJwE0iffcXq4HL9B5yPF4M2xHpD8bUmeX3eu3kbzbZvq9Pe6BmUP92kIsFo+uMpeTDEhLZgGTSUVd++xWBm/kJCWEScauwL7P11I6hmDtTFj9fD/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=webbelectronicsinc.com; dmarc=pass action=none
 header.from=webbelectronicsinc.com; dkim=pass
 header.d=webbelectronicsinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cissecurity.onmicrosoft.com; s=selector2-cissecurity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18pSfcjbA7zIH8gFLB1ZgzkhQm5O0PTL2YySpDAKJ0g=;
 b=AN+PX/yA60RVJtyvwGEHlKh70FAYAwUbEqlDrw+VFUxg8b0WvVsQnpfauYlrKKIdRdJ9JCnzOadP/wH4AMGNYNT3C4iTCrG+MzM2v9K93mWJ/QozBhz9o6qfTDFsYmORso1oM1qIG2SUX6zUK5BrHmD+2ahdLvtMmgFQjP4GkEc=
Received: from CO1PR08MB6580.namprd08.prod.outlook.com (2603:10b6:303:6f::23)
 by CO1PR08MB7015.namprd08.prod.outlook.com (2603:10b6:303:d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Sat, 7 Aug
 2021 00:41:08 +0000
Received: from CO1PR08MB6580.namprd08.prod.outlook.com
 ([fe80::ec05:8aa5:cc0d:f621]) by CO1PR08MB6580.namprd08.prod.outlook.com
 ([fe80::ec05:8aa5:cc0d:f621%3]) with mapi id 15.20.4394.021; Sat, 7 Aug 2021
 00:41:08 +0000
From: Andriy Fudimov <Andriy@webbelectronicsinc.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Cyclic SDMA transfers to SAI haulting on imx6
Thread-Topic: Cyclic SDMA transfers to SAI haulting on imx6
Thread-Index: AdeLJOcEj2ZAYIyKQpeCNN1ovzAk4g==
Date: Sat, 7 Aug 2021 00:41:08 +0000
Message-ID: <CO1PR08MB65805CD523DE41363BB08CC1BBF49@CO1PR08MB6580.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=webbelectronicsinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f619a4a-33ee-454f-ef09-08d9593c0bea
x-ms-traffictypediagnostic: CO1PR08MB7015:
x-microsoft-antispam-prvs: <CO1PR08MB7015D956716AEB866ABB3146BBF49@CO1PR08MB7015.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmLsoruO3jqs3wCiXk7k7EnXlTWaixcFWlTwiMfCa+CMMj6dTmfVsuFn4h2OLNsigdl9V/MQoaNmKUNYa4CGqaln7okFtqmcDAKZxh5QWDqpJ/gtf2ByGokN58qrwM2xy4j+PWbJQgo2XTQlTnuzHfIM8iHSxEDTecRJoTcUP7N3rnI95AtvfFbAjqApjMQipF9bxKUA+MSjuGUSZiMBhvQlKOn3mSTk6drDf0wUbNLMHRjSrRoC+ZxiYOzMKXbiLC+mrXFlAt+pQkWzah8mx2v/G6z3TbQ5LkWS3pdXcBDeHKTMidLi7n6qu/+HIrq2Cc/tMXN+rzpsLtdpaF/dttRwfa68UG0Nrsk+Ra3JnzTLARbd+Sp2XCQcJw87EURiPYVHcWDqNn6hsG6ikzaPj3yyhV/4GO+ggEvaSo5IDOMvw1l+X55Rcda89G5nkhb8/SprPCAFPebbbpqSW47sHdsH9DVIZROtHjNKBowCnihO1O9eAiR4U5V2HPFbskNRRUi2UPg7vBv8El4xmqC8DnbJ3KVSuiXzaHlNHOGh15NtYjvf8k2jVuL4QkiOIMXNatD89OSHNHg6oFMiFmLubRjyZGB/rbstsFVMCmBrySF3AnKVRmcBdRS1NFcl0Ye8F7vBVyrtOu93BUGQz7HmEoyyP7LFw+a4YCLe5ASwGrPYttnDkmA1MmQ9/vAorP7hYSa86uILoTrGZo59lZ1X1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR08MB6580.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(136003)(39840400004)(8936002)(33656002)(186003)(316002)(8676002)(5660300002)(71200400001)(6916009)(76116006)(52536014)(38070700005)(9326002)(66476007)(2906002)(38100700002)(122000001)(478600001)(26005)(55016002)(64756008)(66446008)(66946007)(66556008)(7696005)(86362001)(83380400001)(6506007)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sEALyWnOCA092msO8MKtyoZciC4D+aVj1Rg/3whDkWWmgZaswE2imEWo8GYU?=
 =?us-ascii?Q?tyxahmwIp4KzgpkLZ1ccH0R8zhi9p6LUmv4eGJps5WVMQanhbX6FqOcG8KCJ?=
 =?us-ascii?Q?bJI8efTWjTmmDKQlzvEEQG47u170iupO6HHbXDdxkG3tzkNZnQXAMbdNn3gF?=
 =?us-ascii?Q?w79hT+CdYKrIbCuBOjkvy8C6VY4HTP9lkkYYKsoF+glapCF2iQedBpPz45fL?=
 =?us-ascii?Q?VMe2fp+ufV+T/s2tzdL1vPkvay+XS6Ge1bA8phFwTFgGAWd44pVU0jqBdXW5?=
 =?us-ascii?Q?GxmAx4cAw8MpXU9XoIYiad6dlQ1ykaR8ctXwp4RuTWJ3bVt9IRRSoHoeolN6?=
 =?us-ascii?Q?S+v+JrxnddB+Gbcv7DnWM9NmiulwEd4IYdxxScQn7TZ9EUgGlrnw69/BcxCD?=
 =?us-ascii?Q?Txt24jClhx1yki+BkQ2ZDPrU9NF0hxc78O9iNpN3iPfSi4Rax+yhfsii7LO7?=
 =?us-ascii?Q?V1BLhj0vXGD6z8sbaAy65NH0lONMco1i/nCOH7ocQVo0DMJUqjTuqf/j7SZV?=
 =?us-ascii?Q?aXW7EhL/S/pVES1gyiTTHBFjXAzS2ITBQvPDW49DU4KVGqY/ra6kjk+k+O2O?=
 =?us-ascii?Q?Ocn5MJOxmw8WxUN8zTXJeMW4kdWWRhJzNW3BmOs3cjj31VYmmhLFTYTtynHn?=
 =?us-ascii?Q?tE+z2c486B6WnxX2xj0AXypMBXpFO7qBXbHEEaCwFU0IwCZJp7/VtPLsoEv0?=
 =?us-ascii?Q?PlC723GXKbVSPaFfHnPWlP+bLQERwOwlx3AHRZnJq/W6nU/hw/0NgyNX551A?=
 =?us-ascii?Q?WZ7vwXjEV65PeMRFkMc0FQnFHzLg/8jtOfXDv3yENudGYrpvRpdV4q6qLV6t?=
 =?us-ascii?Q?7dYakcIJmh8nvje5xd6GGEJbaTlRzYvOM0HNvPNHQ2NSjOIg0y/NuEkmqkZ8?=
 =?us-ascii?Q?Naw9MDjCxlcPzx1IeflX3PPEPcYI9JrahY5Cs6r8lWemHodHK1CSTe2ZiqgP?=
 =?us-ascii?Q?VdMcXfbJp0HkARn4NqdjodXDzvxBHUK0myhSRm7M4Rj0nXEhxlibOWIXcK+m?=
 =?us-ascii?Q?+E3E0JSoAwFaqVuuVnUZbIwAFbgz6rXzHr8OMqm5hvtJRC/QStq8JlwWu0Vf?=
 =?us-ascii?Q?ODm3EOQjobbQs2sXtAhxyfoZnVwol6QA6PB1ShnaTAMLjJHL/W2ntBKZ3vR3?=
 =?us-ascii?Q?9iEHqyD1KvRPhebS/pkx4hRf+1IgUbVO3uKjbAF+0vbmwUMvkmScIIUBTl41?=
 =?us-ascii?Q?adK5Gx44ZNPIrfKVaMFPgDpoEGEfJMIZ3zhLy8b3qx1YaknjvoF2ky8g6I4u?=
 =?us-ascii?Q?ZxPyXvZOjJLMM64skMbJcjv1wVQwAk27qlkdPh2oXmtESGTOlKjuouLUCzuI?=
 =?us-ascii?Q?ln0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: webbelectronicsinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR08MB6580.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f619a4a-33ee-454f-ef09-08d9593c0bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2021 00:41:08.1137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 68bbf09b-0784-4ace-aa69-3ade09053e52
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CaG6vqQAc6CLRwGGDH8a7ge5ucG3rEuT6orpVTxM9F89nTI0UKlg1d3u0Un7TNM7Erg/rHwnHjk44wR1jqaFZrZsqQKsgeK0RdQ+Bq+tTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB7015
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi,
Im trying to set up a cyclic dma transfer to/from the sai on an imx6, but i=
m noticing weird behavior. First of all if my buffer length is small the DM=
A transfer will just hault as soon as it reaches the end of the buffer. If =
I make my buffer length larger it wont hault however it seems that only one=
 of the rx or tx transfers can be on at once. Once my rx callback starts ge=
tting called my tx callback stops being called.
Any tips would be appreciated.

#define HARDWARE_BUFFER_BYTES 64*2 //* 2
#define HARDWARE_BUFFER_PERIOD_BYTES 32*2

static void dma_rx_complete(void *data)
{
    rxstacnt++;
    printk("rxstacnt: %u\n",txstacnt);
}

static void dma_tx_complete(void *data)
{
    txstacnt++;
    printk("txstacnt: %u\n",txstacnt);
}

static int imx_tx_pingdma_init(struct imx_dma *master, struct device *dev)
{
    int err;

    dma_addr_t pcm_hardware_reg_base;
    const __be32 *addr;
    addr =3D of_get_address(dev->of_node, 0, NULL, NULL);
    if (!addr) {
        dev_err(dev, "could not get pcm hardware register address\n");
    }
    pcm_hardware_reg_base =3D be32_to_cpup(addr);
    master->dma_tx =3D dma_request_slave_channel(dev, "tx");
    if (!master->dma_tx) {
        dev_err(dev, "no tx-dma configuration found - not using dma mode\n"=
);
        tdm_dma_release(master);
        return -1;
    }

    master->dma_rx =3D dma_request_slave_channel(dev, "rx");
    if (!master->dma_rx) {
        dev_err(dev, "no rx-dma configuration found - not using dma mode\n"=
);
        tdm_dma_release(master);
        return -1;
    }

    /* configure DMAs */
    master->tx_ping_buffer =3D
        dma_alloc_coherent(master->dma_tx->device->dev,
        HARDWARE_BUFFER_BYTES,
        &master->tx_ping_buffer_dma,
        GFP_KERNEL);

    if (!master->tx_ping_buffer) {
        dev_err(dev, "could not allocate dma address\n");
        tdm_dma_release(master);
        return -1;
    }

    memset(master->tx_ping_buffer, 0, HARDWARE_BUFFER_BYTES);

    master->rx_ping_buffer =3D
        dma_alloc_coherent(master->dma_rx->device->dev,
        HARDWARE_BUFFER_BYTES,
        &master->rx_ping_buffer_dma,
        GFP_KERNEL);

    if (!master->rx_ping_buffer) {
        dev_err(dev, "could not allocate rx dma address\n");
        tdm_dma_release(master);
        return -1;
    }

    memset(master->rx_ping_buffer, 0, HARDWARE_BUFFER_BYTES);
    master->dma_tx_slave_config.direction =3D DMA_MEM_TO_DEV;
    master->dma_tx_slave_config.dst_addr =3D 0x202c000 + 0x20;
    master->dma_tx_slave_config.dst_maxburst =3D 1;
    master->dma_tx_slave_config.dst_addr_width =3D 4;
    master->dma_tx_slave_config.src_addr =3D master->tx_ping_buffer_dma;
    master->dma_tx_slave_config.src_maxburst =3D 1;
    master->dma_tx_slave_config.src_addr_width =3D 4;

    err =3D dmaengine_slave_config(master->dma_tx,
        &master->dma_tx_slave_config);

    if (err < 0) {
        printk("could not setup slave_tx_config\n");
        tdm_dma_release(master);
        return err;
    }

    master->dma_rx_slave_config.direction =3D DMA_DEV_TO_MEM;
    master->dma_rx_slave_config.dst_addr =3D master->rx_ping_buffer_dma;
    master->dma_rx_slave_config.dst_maxburst =3D 1;
    master->dma_rx_slave_config.dst_addr_width =3D 4;
    master->dma_rx_slave_config.src_addr =3D 0x202c000 + 0xa0;
    master->dma_rx_slave_config.src_maxburst =3D 1;
    master->dma_rx_slave_config.src_addr_width =3D 4;

    err =3D dmaengine_slave_config(master->dma_rx,
        &master->dma_rx_slave_config);

    if (err < 0) {
        printk("could not setup slave_rx_config\n");
        tdm_dma_release(master);
        return err;
    }

    master->dma_tx_desc =3D
        dmaengine_prep_dma_cyclic(master->dma_tx,
        master->tx_ping_buffer_dma,
        HARDWARE_BUFFER_BYTES,
        HARDWARE_BUFFER_PERIOD_BYTES,
        DMA_MEM_TO_DEV,
        DMA_CTRL_ACK | DMA_PREP_INTERRUPT);

    if (!master->dma_tx_desc) {
        printk("could not setup dma_tx_desc\n");
        tdm_dma_release(master);
        return -1;
    }

    master->dma_rx_desc =3D
        dmaengine_prep_dma_cyclic(master->dma_rx,
        master->rx_ping_buffer_dma,
        HARDWARE_BUFFER_BYTES,
        HARDWARE_BUFFER_PERIOD_BYTES,
        DMA_DEV_TO_MEM,
        DMA_CTRL_ACK | DMA_PREP_INTERRUPT);

    if (!master->dma_rx_desc) {
        printk("could not setup dma_rx_desc\n");
        tdm_dma_release(master);
        return -1;
    }

    master->dma_tx_desc->callback =3D dma_tx_complete;
    master->dma_tx_desc->callback_param =3D master;

    master->dma_rx_desc->callback =3D dma_rx_complete;
    master->dma_rx_desc->callback_param =3D master;

    printk("DMA configured by success!\n");
    return 0;
}

static void start_dma(struct imx_dma *master)
{
    master->dma_tx_cookie =3D dmaengine_submit(master->dma_tx_desc);
    dma_async_issue_pending(master->dma_tx);

    master->dma_rx_cookie =3D dmaengine_submit(master->dma_rx_desc);
    dma_async_issue_pending(master->dma_rx);

    printk("DMA submited! dma_tx_cookie:%d\n", master->dma_tx_cookie);
    printk("DMA submited! dma_rx_cookie:%d\n", master->dma_rx_cookie);
    txcnt =3D 0;
}
