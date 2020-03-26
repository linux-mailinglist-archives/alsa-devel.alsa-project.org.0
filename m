Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7395194553
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 18:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2026C1671;
	Thu, 26 Mar 2020 18:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2026C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585243285;
	bh=ksT3A9f5EH2Q7DNwYO2axGEtGw1mEzEaIYIXGYzZnnk=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CTQH3qkjJK8yvPEA078HFVVwhnh+WMhhCoNEPQ+DPpHwstbrB7wGYVu5q6Pu75Cl4
	 wFrGGzqRNGkEUvDoCnJt/w3FdRaBP5mK00qyobPhxD5HyVq+bnwtty6VrS2XAa6pqz
	 CMmuHDuajS1686dEpVUh7+A3j0sOsScRjZTxPxds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4371DF80234;
	Thu, 26 Mar 2020 18:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B210F80227; Thu, 26 Mar 2020 18:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA1A7F80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA1A7F80095
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id CF2EDA1EE2D10
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:19:34 +0100 (CET)
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNg9ejvah0By for <alsa-devel@alsa-project.org>;
 Thu, 26 Mar 2020 18:19:29 +0100 (CET)
Received: from [192.168.105.191] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 8CDE9A1ED7777
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 18:19:29 +0100 (CET)
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Functionality of pcm_notify in snd-aloop?
Message-ID: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
Date: Thu, 26 Mar 2020 18:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
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

Hi,

Please how is the module params pcm_notify supposed to be used, to do
what the documentation says: Break capture when PCM format/rate/channels
changes?

Breaking capture side operation when the playback side changes the
params is very useful, but I cannot find a way to use this param
properly. When the capture side is open, the playback side cannot use a
different parameter than the one currently used by the capture side (the
configuration space is limited) - how can the param be changed then?

Thanks a lot for help.

Best regards,

Pavel.
