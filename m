Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5AA559E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3713116BC;
	Mon,  2 Sep 2019 14:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3713116BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567426312;
	bh=EKdkm53RxDVRITgrVfBYCoBlJs2Z6+mYPWOuUHp5m64=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=U1OeIc1iq6DEIpljZTpxKpSVeEtG9zStpKSCofYq+jz2CNtPxI3ZYZngYHNRPkaiK
	 QOn2SyXWDQCDgS+7e/ltZT0RA27X1bW89X6h+xyyKf4WQhK4KKanc1qmM8ruKuP+jr
	 b7lxIkqEp9evW1Zj3gGlV4/DPMf2npvh77NaFrmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210F8F80447;
	Mon,  2 Sep 2019 14:10:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 780BBF803D0; Mon,  2 Sep 2019 14:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA38F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA38F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Ln/nRmFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1567426200; bh=hYsrMg8BkUcYgBDUwkZv/evNx7sQOR+oJOueeKNyDW4=;
 h=Date:From:Reply-To:To:Subject:From:Subject;
 b=Ln/nRmFinUmvQPL3BK+B9x7snYEEs9jDwyko0SCf7GwrnFc9cKXXsCjG5AvkJT+pudyD53rkkVhoxzPhjL7ThMCetirxWrwTtBrhztHWI1ww8tvGqs0YKOpxF8l9Qyg/Ahr6I42tN8Dfj4Ywd3SMo7F8YVYiMs/+GNU5VGkR8Cm+h5V+muAYuR1dFbT5T1L4mU4ByVTGspfxpK+1/6RW4eh80c/GjZUSHEEBTKpus+56tMpX2L6sVfFnzEBZE0zt4G1TJz2q+gkZAy7jnjmZmV0OSpLXpTZy3B2+F4rhOUCARLyIkpF8l23yuVo3gb7WskfP+iUrRU1MN984hPdu6A==
X-YMail-OSG: cRhQKbsVM1kEP3U0UaAkZ8mmMQJ1l7Hk338aMa7kEDJ7mI6_5sV1sFueh6REvHw
 _LpFpAGBmtc1XMG4w_z43ZDHxF9yZwMY5yaHOxXGM83stt6fSTgHY2B6kCxgti8xeYqVXCKYl8q.
 s0_r4ReBI7UkhTciKJ6A1ytmIRKcayVGE3RAiz.uVleriDnw0QHuKLZU17jISNcWwCNJKL0PkyEj
 58Nvvxs3UXG47uluRJrVV2.pm2B7U7GmQaqOQxyb_gtdvldG4iTkhYPmTzIwoBbuPLLEdXVx2tGz
 GvHbc4isde4pVg3HJzxwot8LbvxxZ2dunMvubtjuBV.qALsfnVk2yHm3C4Vw_7tadNTC76UzUhPp
 KOirO8N2nV89oPbxyI18M0bXFCLmCL_egzz_KGE6Ca6ICRMrVC_W2Eto6WVzzuQv4JpruPnb6RHP
 DthuXUUs5grV8u72Jn4VUVufilPA7kqDf.uzyLBm84_DjDttGsF6NTbjAfaWK8P7AzzbOlkXFT8A
 2hYrdqeD6LRxwWjqbSQ3HQiEcRY8e7m4QlDjF0A2GpcJy8muLkg_hikFrpJx0ViXRmMVoI6tVUXW
 rgLHUXKa3EXMMh6.JE0W2XInripbRu_qA5MctjiRUoE71q5B7igTvclnowagsDeB1QIWf8G0j1Ab
 6RVd0eEZBuptkfZgfIOa28sGsX0xvfrrhdZ4qHZSUbXwK1IJAeKxs_XbibOQjG0DTc4htq5ck5rl
 erpbgCmUhnckkBvSR.h4qWYJNzcTJmVvisFdp4Vf4p59fWPdLvyCs.OOrLd6qZ9huod5goue7nho
 llCcUaYctvTTK83yUGho9IRWTRnFSChDMpGqtXmAzDSHkaGr8tLcRSBkNl1DoWyNU2KUnV811BLI
 RXMcBCWZxbL8ZaVWRO_suLZWqo7jR5hVZpnpdzNsNdi4ysREn0BLJkPOZm7XH0HbPuYbqjF3NUnw
 uViPrvaLetQuOMPv.ozCYZgWpQP6MPzm3sex241lO8tLvLe3BSctVjhwEFfuwKvSNcvMUvMsMDDd
 Vr8SX_koBsyZFixPeKMVD1ABBwyVTGR7NKfMmUQan.05TBKA3sHr9cirEqwDa53XLT3vE.29eV.j
 v5k7agMJ6QWoOh3wMv2ZTELx5.nW3nC_0CHYJwGVdhlRhnRD_MXC6YqA8v725kftN.DY5BDw6cSQ
 Kr_9AYIuizzXqjs8u9PGFtKEtiVKD0sagHfD4MIac8_YRvzJAnzd2VmxmqFtlW3USEcpVG8_LiPk
 tb.cRPTZoEIPsKTbIaQ7YytV4v2SXYJrqKJ8ZmD8_9ZWoASKKe87JZMo-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Mon, 2 Sep 2019 12:10:00 +0000
Date: Mon, 2 Sep 2019 12:09:56 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: alsa-devel@alsa-project.org, tiwai@suse.de, g@b4.vu
Message-ID: <1091462655.1815609.1567426196596@mail.yahoo.com>
MIME-Version: 1.0
Subject: [alsa-devel] sound/usb kernel modules as a DKMS package.
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

I (We... this is kind of my 9-5 job) have been having some reliability issue with a Focusrite Scarlett Gen 2 18i20, and I was almost tempted to start looking at the windows driver, when I came upon Geoffrey's work. So I made the bleeding-edge sound/usb modules (for the 5.4 time frame) from Takashi's tree built as dkms modules against main line 5.2 . I hope this is useful for other people using USB sound devices.

https://github.com/HinTak/sound-usb-dkms

This make it easier  / faster to try out new code, without building the whole kernel.

I would appreciate tips and tricks about the Scarlett 18i20, as well as general recommendation for new professional gear of the same sort to buy.

Incidentally, Tobias Hoffmann (who wrote the first gen driver about 5 years ago) was my GSoC student working on printer-related matters more than a decade ago; I did some wifi/USB related work in the kernel (am listed in linux/MAINTAINERS) so you can assume that I am relatively happy with driver-related matters.

Cheers,
Hin-Tak
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
