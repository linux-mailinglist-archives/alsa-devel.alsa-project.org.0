Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4437F51E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 11:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3978C17DB;
	Thu, 13 May 2021 11:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3978C17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620899842;
	bh=B9AxRodzGrzsdL+DNaf0Et/G2sNymV4G+L9xYeb028c=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l18CrjOzIjeL0egQYzyb7N7gKzL8cBMor0BjDAQ2wE2d9zl/x+RwlgyNkv3XNvzoQ
	 AF2FFlRhmEKQC/APZ67J0EOTjgR7uVAfAdUxaNQqeSSN8eYGRkod/zNzLdMnGW8xly
	 IKncENGegWBH0xXDlHLBblm7bA46AE1SOWEr3xZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F812F800E3;
	Thu, 13 May 2021 11:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF524F80163; Thu, 13 May 2021 11:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51D27F800E3
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 11:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D27F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="FOLhRvj7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=swing;
 h=Content-Type:MIME-Version:Message-ID:Subject:cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LR4DVDL+mmo1lQEghfGExSqWApiOePCfuDSLSSADt+s=; b=FOLhRvj7V8ukEeskipLfi0GgTO
 WrEzqlr9U3FY/bsccdOOzLQZRFe1UFluK4+XB20wEzQVxDnKiODkhnYDAkwt1R0RlgTafVB676nqt
 ASZqEQQYjMSdEHcUukSiaOrgEMUYxxevLropLvsHdW+8Qybi8gpcQVwKQhVxESxVLPbE=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1lh84K-000Kl5-CT; Thu, 13 May 2021 10:55:47 +0100
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id ee67a9f5;
 Thu, 13 May 2021 09:55:46 +0000 (UTC)
Date: Thu, 13 May 2021 10:55:46 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: alsa-lib dmix segfault; latest Git
Message-ID: <2105131051530.22897@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

The current Git master looks very broken, segfaulting immediately.

It seems to be caused by commit 27f4a85a95 ("pcm: direct - move the direct 
struct init to _snd_pcm_direct_new()")

Here's the trace:

$ aplay -D plug:master testing.wav

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7f14ea6 in snd_pcm_dmix_open (pcmp=0x7fffffffe170, name=0x0, opts=0x7fffffffdef0, params=0x7fffffffdf30, root=0x43b1e0, sconf=0x455ae0, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm_dmix.c:1017
1017            pcm->ops = &snd_pcm_dmix_ops;
(gdb) bt
#0  0x00007ffff7f14ea6 in snd_pcm_dmix_open (pcmp=0x7fffffffe170, name=0x0, opts=0x7fffffffdef0, params=0x7fffffffdf30, root=0x43b1e0, sconf=0x455ae0, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm_dmix.c:1017
#1  0x00007ffff7f15763 in _snd_pcm_dmix_open (pcmp=0x7fffffffe170, name=0x0, root=0x43b1e0, conf=0x43b620, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm_dmix.c:1374
#2  0x00007ffff7ec72d8 in snd_pcm_open_conf (pcmp=0x7fffffffe170, name=0x0, pcm_root=0x43b1e0, pcm_conf=0x43b620, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm.c:2609
#3  0x00007ffff7ec7a1b in snd1_pcm_open_named_slave (pcmp=0x7fffffffe170, name=0x0, root=0x43b1e0, conf=0x43b620, stream=SND_PCM_STREAM_PLAYBACK, mode=0, parent_conf=0x43c390) at pcm.c:2823
#4  0x00007ffff7ee38a3 in snd_pcm_open_slave (pcmp=0x7fffffffe170, root=0x43b1e0, conf=0x43b620, stream=SND_PCM_STREAM_PLAYBACK, mode=0, parent_conf=0x43c390) at pcm_local.h:1008
#5  0x00007ffff7ee87a3 in _snd_pcm_route_open (pcmp=0x7fffffffe420, name=0x43cc50 "master", root=0x43b1e0, conf=0x43c390, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm_route.c:1367
#6  0x00007ffff7ec72d8 in snd_pcm_open_conf (pcmp=0x7fffffffe420, name=0x43cc50 "master", pcm_root=0x43b1e0, pcm_conf=0x43c390, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm.c:2609
#7  0x00007ffff7ec7547 in snd_pcm_open_noupdate (pcmp=0x7fffffffe420, root=0x43b1e0, name=0x43cc50 "master", stream=SND_PCM_STREAM_PLAYBACK, mode=0, hop=1) at pcm.c:2668
#8  0x00007ffff7ec79f4 in snd1_pcm_open_named_slave (pcmp=0x7fffffffe420, name=0x0, root=0x43b1e0, conf=0x43c320, stream=SND_PCM_STREAM_PLAYBACK, mode=0, parent_conf=0x43d120) at pcm.c:2821
#9  0x00007ffff7ef57ba in snd_pcm_open_slave (pcmp=0x7fffffffe420, root=0x43b1e0, conf=0x43c320, stream=SND_PCM_STREAM_PLAYBACK, mode=0, parent_conf=0x43d120) at pcm_local.h:1008
#10 0x00007ffff7ef824e in _snd_pcm_plug_open (pcmp=0x413768 <handle>, name=0x7fffffffebbb "plug:master", root=0x43b1e0, conf=0x43d120, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm_plug.c:1324
#11 0x00007ffff7ec72d8 in snd_pcm_open_conf (pcmp=0x413768 <handle>, name=0x7fffffffebbb "plug:master", pcm_root=0x43b1e0, pcm_conf=0x43d120, stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm.c:2609
#12 0x00007ffff7ec7547 in snd_pcm_open_noupdate (pcmp=0x413768 <handle>, root=0x43b1e0, name=0x7fffffffebbb "plug:master", stream=SND_PCM_STREAM_PLAYBACK, mode=0, hop=0) at pcm.c:2668
#13 0x00007ffff7ec7610 in snd_pcm_open (pcmp=0x413768 <handle>, name=0x7fffffffebbb "plug:master", stream=SND_PCM_STREAM_PLAYBACK, mode=0) at pcm.c:2698
#14 0x00000000004054ab in main (argc=4, argv=0x7fffffffe898) at aplay.c:850

-- 
Mark
