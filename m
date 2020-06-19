Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665692009E5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 15:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4358167B;
	Fri, 19 Jun 2020 15:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4358167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592573018;
	bh=L+n/ZaJbxec7vPcxg4r8eWioYWdXsYrVeUHtG/X4i/Y=;
	h=Subject:References:To:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tjTcMOZdXrfqkHNf+8qiwztsMNyBWRQ+5ZOGbQo9OQxwjkcyVdn79wptSINnuVOxT
	 lvTaVb6RoV5mVtTp6hT3JHpgTKPrlm84Ok3oMhZQN22QC2lcLsgdcz5a8issgu1I6v
	 9Y6oV1nVAH5z2NFCM6lXwQODtolASZzsogd0oGXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69714F80255;
	Fri, 19 Jun 2020 15:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99E2F80252; Fri, 19 Jun 2020 15:21:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1420F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:21:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 60B56A003F
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 60B56A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592572910; bh=AnbSLpEyHOlx8cCtLxIb5nSHEriOfo5yIqMFFfY7CVw=;
 h=Subject:References:To:From:Date:In-Reply-To:From;
 b=imbV4CVs51x0/3Tnca06dMpi4ozshdgv9sGFYUtKO0ZxzDot9LfFaFl/lEDXIfvZ8
 SLb1Z31V9PG83oabdIe91EzvD14cUlp+3eyCWT1ywlRzPrOEZoJCPnvTO9SXUnA2hK
 KSrPSKbYV32SnnSbkeqK9SyjRTXAejXdjUQi4tLo=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:21:49 +0200 (CEST)
Subject: ALSA library 1.2.3.1 release
References: <3e33ace6-e129-55ee-5dbd-c0763f33f925@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
X-Forwarded-Message-Id: <3e33ace6-e129-55ee-5dbd-c0763f33f925@perex.cz>
Message-ID: <a213c1d1-4be5-0ad4-4bfd-ace13a8a0b10@perex.cz>
Date: Fri, 19 Jun 2020 15:21:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3e33ace6-e129-55ee-5dbd-c0763f33f925@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello all,

      new bugfix alsa-lib package version 1.2.3.1 was released. You may 
download it from the ALSA website http://www.alsa-project.org or directly from 
the FTP server ftp://ftp.alsa-project.org/pub .

      This bugfix release fixes the wrong variable access (in the dynamic 
library lookup routines) which leads to the pulseaudio crash when the new ALSA 
sound card is probed. There are also some UCM code fixes and little extensions.

Full list of changes:

      https://www.alsa-project.org/wiki/Changes_v1.2.3_v1.2.3.1

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
