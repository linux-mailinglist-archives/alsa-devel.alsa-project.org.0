Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A952212DA0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 22:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB0F16F1;
	Thu,  2 Jul 2020 22:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB0F16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593720411;
	bh=5u91dwaaOFLbQ8pq5j51tBSdCcyDi962mmKf12Dj6TQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cIINSV72SVvMLFoc/MZpgtOgGTPji1W4XI+19IWWRwBthh0NfQfeKqWK/9M5a4iMn
	 MwkJ085gaMPuySj/hW7Sv3esUm7JOgwJdeadi4cieA/pmgmdU+Q6yIWswsluh5OD3C
	 hfIlZILT2rLR5YcIcq/NqWc07HBaraMP/ou1o0fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2816BF80245;
	Thu,  2 Jul 2020 22:05:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 225B8F8022D; Thu,  2 Jul 2020 22:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 147DDF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 22:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 147DDF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="UuA6dOY4"
Received: from [192.168.178.45] (x4dbdd1d6.dyn.telefonica.de [77.189.209.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id D11D617A0AF0
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 22:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1593720301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/9Jje8WBwd+iU+3+fdc1VGl5HOySMO+pZADWB74EdU=;
 b=UuA6dOY4gkd3NQghbIXeWAZXoYHeGrrjlIcgBskCH1oA89db2mUQvoMHdajdZinzBhlxuL
 KhbEt4H+hFa2fvfUVc3bcgcdq+7jFNuZ39BZv/GqY8RnCxMt+Z1xjenXINCLx/f53XjegX
 4z9STobeZCxpOV0Q+eSt+xLmAzqiIY4=
To: alsa-devel@alsa-project.org
From: Tanjeff Moos <tanjeff@cccmz.de>
Subject: How to identify Alsa eLements?
Message-ID: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
Date: Thu, 2 Jul 2020 22:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
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

Hi alsa-devel,

I'm programming a GUI for the mixer in my Focusrite Scarlett 6i6 
interface. The Alsa driver supports that functionality, i.e. I can 
control the mixer using alsamixer, for example. Now I'm writing a Qt GUI 
for it.

I wonder how I can reliably identify a mixer control element (e.g. the 
master volume control). Each element has an ID (struct snd_ctl_elem_id), 
consisting of multiple elements:
- numid (seems to change at each boot)
- iface
- device
- subdevice
- name (is always constant)
- index
The docs says I can identify an element by the combination of name and 
index.

My questions:
1) Are name and index enough to identify an element?
2) How can I obtain the index? The name and numid are shown by 'amixer
    contents', for example.

Kind regards, Tanjeff

