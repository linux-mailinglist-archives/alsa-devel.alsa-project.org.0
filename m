Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E39981C0406
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 19:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856511693;
	Thu, 30 Apr 2020 19:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856511693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588268596;
	bh=RO+0h0LylCb4VVkUpK6/gwky3bNYFyp0LKkssN6q9lg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvLEjh0kO6PcgLlX+tQM4lTQF1b+7qPyfSbpOGYPIgIFe4YFSBmmAkJSdUO/3M4NZ
	 o1nqO2tP+m/3/8krEsoFdyb9Snw87OoDo74dAnxgb2Yy+dCUtidPb0/XdHlw7JtMz/
	 S1nOWYiaJv6StFc64tqLLbDiX9YoRb9IhabBPjkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 858B3F8028D;
	Thu, 30 Apr 2020 19:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E6E0F801DB; Thu, 30 Apr 2020 19:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA06F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 19:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA06F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="YeK8EcqR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=XXaiXo9PQJLqrg66EO1dFlMYW/lycKABqI7j+xr4iis=; b=YeK8EcqRmWIAbX0w0AQ1JESX26
 hSVl0Rmf58K0MWs0dfCiACMWGLnwvf6JXOBxvvwyHdLyIrgZUrF8Z9v14kwRaXkiGt+/omQGMX/Hz
 xAzjTlO4njWCHAJZimu/D5OJdvwEWdn0V6CVSj6/8H/FcvG5QqNvanL/B4U/7Vq1iJe4=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jUDAw-005vyF-DX; Thu, 30 Apr 2020 20:40:42 +0300
Message-ID: <4a3953a7480744ed4b6e0f4805fa5815fd0bd272.camel@tsoy.me>
Subject: Re: Pioneer DJ DJM-900NXS2 support patches
From: Alexander Tsoy <alexander@tsoy.me>
To: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>, 
 alsa-devel@alsa-project.org
Date: Thu, 30 Apr 2020 20:40:41 +0300
In-Reply-To: <b1f8414d-81d3-3f8b-e2c7-d536858d1bb6@d-systems.ee>
References: <b1f8414d-81d3-3f8b-e2c7-d536858d1bb6@d-systems.ee>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Ср, 29/04/2020 в 12:56 +0300, Dmitry Panchenko | d-Systems пишет:
> Pioneer DJ DJM-900NXS2 is a widely used DJ mixer with 2 audio USB 
> interfaces. Both have a MIDI controller, 10 playback and 12 capture 
> channels. Audio endpoints are vendor-specific and 3 files need to be 
> patched. All playback and capture channels work fine with all
> supported 
> sample rates (44.1k, 48k, 96k). Patches are attached.

Thanks for the patch.

> +                                       .endpoint = 0x01,
> +                                       .ep_attr = USB_ENDPOINT_XFER_ISOC|
> +                                           USB_ENDPOINT_SYNC_ASYNC|
> +                                           USB_ENDPOINT_USAGE_IMPLICIT_FB,

Playback endpoint shouldn't have a USB_ENDPOINT_USAGE_IMPLICIT_FB
attribute.

