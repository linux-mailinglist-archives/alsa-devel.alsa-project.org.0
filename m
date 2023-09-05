Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FC792105
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 10:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D0E825;
	Tue,  5 Sep 2023 10:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D0E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693902845;
	bh=jHhNJ09QaNiKgYRH6DGvjA15JLyqQGPonrkhGaBbonI=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pIXFA+1AhcWB8Fb3cwJQSCFaoztpfzP8pdeYPAxgb5xs/D6gIJy15FM6ljltspncf
	 1D7Y78EYPtuiIJ565ugNryJzEMipOKgLM8XZfXgVUTkD4wmsGl2JHoKWqKF3b1K27O
	 CELhk03lUPfLe2/J2febiwLz5zByU/QEqgCHPlB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48FC8F80431; Tue,  5 Sep 2023 10:33:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 095B4F80431;
	Tue,  5 Sep 2023 10:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB76F8047D; Tue,  5 Sep 2023 10:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dedi0149.zxcs.nl (dedi0149.zxcs.nl [185.104.30.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B23F80141
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 10:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B23F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=sttc-nlp.nl header.i=@sttc-nlp.nl header.a=rsa-sha256
 header.s=2023051004 header.b=Gk88AVnv
Received: from [192.168.1.249] (unknown [85.148.132.45])
	by dedi0149.zxcs.nl (Postfix) with ESMTPSA id BC4099813C6
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 10:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sttc-nlp.nl;
 s=2023051004;
	t=1693902591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DyUf59FhxG0rhXBa4mcDXy67+rbFcEgvw7W0gceSWVw=;
	b=Gk88AVnvmxeecppRxwRUBVHRAg2wIecrpv5K3WjqcqWmdPWRatLFBFVOP/cacSZhN8/Gmw
	j6W2vgjvh0il1z/+9nP01BsgW23dBPy79JkpZ+GRZSwHQcbNxyxBPAsM+bsYMWoBBoE21T
	73MCCS5PfeU+Bj0FHN2Llqw16anoV7w=
Message-ID: <3e94e9e7-e2b0-4683-9276-ffaf5e1d1f18@sttc-nlp.nl>
Date: Tue, 5 Sep 2023 10:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: alsa-devel@alsa-project.org
Content-Language: nl, nl-NL, en-US
From: Ferdi Scholten <ferdi@sttc-nlp.nl>
Subject: Missing dependency for SND_SOC_SOF_IPC3 in SND_SOC_SOF_SKYLAKE and
 SND_SOC_SOF_SKL in Linux 6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ferdi@sttc-nlp.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SYXFBBCUKM5UJL7U2FHSWDJBWTHYTVME
X-Message-ID-Hash: SYXFBBCUKM5UJL7U2FHSWDJBWTHYTVME
X-Mailman-Approved-At: Tue, 05 Sep 2023 08:33:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYXFBBCUKM5UJL7U2FHSWDJBWTHYTVME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear reader

When compiling the linux 6.5 kernel for my Lenovo p52s building fails 
with the following error:

ld: sound/soc/sof/sof-client.o: in function `sof_client_ipc_rx_message':
sof-client.c:(.text+0x45b): undefined reference to `sof_ipc3_do_rx_work'

In my sound configuration I have only selected SND_SOC_SOF_SKYLAKE and 
SND_SOC_SOF_SKL to be built as those are the needed drivers for my 
system and this worked just fine with the linux 6.4 kernel

Selecting only these drivers in linux 6.5 does not select 
SND_SOC_SOF_IPC3 but they depend on it.

resorted to also building SND_SOC_SOF_BROADWELL as a module so 
SND_SOC_SOF_IPC3 does get built.

Please add SND_SOC_SOF_IPC3 as dependency for SND_SOC_SOF_SKYLAKE and 
SND_SOC_SOF_SKL

Thanks in advance
Ferdi Scholten
