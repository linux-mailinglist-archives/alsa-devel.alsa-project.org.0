Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97117E4CC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 17:31:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782B01681;
	Mon,  9 Mar 2020 17:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782B01681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583771482;
	bh=GPfZ2sJXdk/ljwvXj5II6kTq9QX6zu4+e6d2iW1novc=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=r1AAeiYfgK6D9AnrRfuGJX547frU5sWFw5gAswU8GvXcP7Ohr0W2o3nIAzlHKmEBo
	 +/LHeAHXKdlh4avTfOwkb9O8NRWUOUIxWbW/BJzpmqQrMN/+av6GjaekRKNGdRoRmP
	 WS9wnLgF5m76emXgrhFfy1o0twHPFqeOvvHwLweQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5203EF801EB;
	Mon,  9 Mar 2020 17:29:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5055CF80171; Sun,  8 Mar 2020 16:11:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C528F800B5
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 16:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C528F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="kB/HWARO"
Date: Sun, 08 Mar 2020 15:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1583680257;
 bh=GPfZ2sJXdk/ljwvXj5II6kTq9QX6zu4+e6d2iW1novc=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=kB/HWARO44ufItewhH9iiDAbGPxqMQx8VA0XkN/1Ll6K2zBiDTYIRO5U1KPHrdy/U
 8RbMko7zGpPguWYfxKIN2WAUpH5SV7jzUrdRTvNnou0l6ndGw2kJwiX6W4Yux/dwJS
 PTMsalFs9vlINIyaP3b/DYoXRoIWjGgx3JEpZ/BA=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: andythe_great <andythe_great@protonmail.com>
Subject: Port HDA Analyzer to python 3
Message-ID: <ol12k6zTg1bF6sZnv01hgWTqv1uqtvMWljgnxbh_d4uOGiQfSLHsaRbmQ7ddFfSu8taOrpCW0yvBMuxa5JVLs-ZtSDVy1-Eyj30Cp-WymZs=@protonmail.com>
Feedback-ID: 16DksG2N8KG1vbeo3c4XxkUoV9jleFKWqd2aA4aZ0wgJU0iBj2hhIOrld09c0oGfpAmQdrFc_UX03VmAt7VLfw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2020 17:29:39 +0100
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
Reply-To: andythe_great <andythe_great@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

Is it possible to port HDA Analyzer to python 3? https://www.alsa-project.o=
rg/main/index.php/HDA_Analyzer

Because openSUSE is retiring python 2.

I tried using python-modernize https://python-modernize.readthedocs.io/en/l=
atest/ but many could not get it to run.

Thanks.
Andy
