Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237487E5653
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 13:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D16886;
	Wed,  8 Nov 2023 13:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D16886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699446671;
	bh=qV41VErzNkhUep5JKv5gk/MPa/tjVq1ZVQyXhiGegoU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cr1nn5W78nHIHvgUyeh71rhAhFNaXU+AnpkdvFuML1DeMZu+fuzMTIfMJwvsMlChR
	 tgVwEGLS4e8lCThhgXXxlh2qq1DnJqxYxSnNU4T9AgbQOW4UZidUOVSmkbLbeD9tT3
	 5F2LKc9pKQvPywUEwQbmSppkP2vAAz9+XW9SX8Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E01BFF80557; Wed,  8 Nov 2023 13:30:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA77F80169;
	Wed,  8 Nov 2023 13:30:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC0E6F8016D; Wed,  8 Nov 2023 13:30:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_HELO_TEMPERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BDDEF80100
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 13:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDDEF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=mo6Gx1e7
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231108123002epoutp01b7e73f9fe4bdd4ba4dac42f9b9199789~Vpa4_X8WM2862728627epoutp01i
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 12:30:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231108123002epoutp01b7e73f9fe4bdd4ba4dac42f9b9199789~Vpa4_X8WM2862728627epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699446602;
	bh=GT4MUGZ7w69dWPxfmZ+r7fGQzcdedGrlD2k7PVxqXyA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mo6Gx1e7so0YEH1PVNhRZBa/RddDmjXNomk0aaWYTfLgcRtMq+FM5kYY388HyPSZH
	 41ao8XhQYCbSR6qotcK8IRBkTbK67SYC1RDRJqDlXZvmo/9QrQUZim0pbo3zNyFEE0
	 fCsR1HtT/RSczG8ZizoYx1GiIWs2KNcwJNNCzvK8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20231108123001epcas2p1f034e8149eeb30c43e73adc22054b7c3~Vpa4iLAGp1945519455epcas2p1l;
	Wed,  8 Nov 2023 12:30:01 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp3.localdomain
	(Postfix) with ESMTP id 4SQPYP4pHzz4x9Pw; Wed,  8 Nov 2023 12:30:01 +0000
	(GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20231108121427epcas2p258dc03460150a32e64598c4a3b8eb8c7~VpNSTOgW00153401534epcas2p2L;
	Wed,  8 Nov 2023 12:14:27 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231108121427epsmtrp2e0308bc4eac587934a70b7eeef4b6492~VpNSSjffK1488514885epsmtrp2k;
	Wed,  8 Nov 2023 12:14:27 +0000 (GMT)
X-AuditID: b6c32a28-a2ffe70000001cc8-16-654b7ba3a165
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.17.07368.3AB7B456; Wed,  8 Nov 2023 21:14:27 +0900 (KST)
Received: from KORDO035882 (unknown [12.36.182.71]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231108121427epsmtip26025d156d56010e8bfae64f8a2af6420~VpNSF-atg1819418194epsmtip2j;
	Wed,  8 Nov 2023 12:14:27 +0000 (GMT)
From: =?ks_c_5601-1987?B?sK29xcf8?= <s47.kang@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
Cc: <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
	<lgirdwood@gmail.com>, <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>, <cpgs@samsung.com>, <pilsun.jang@samsung.com>,
	<seungbin.lee@samsung.com>, <donghee.moon@samsung.com>
In-Reply-To: <87y1f9r705.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: core: Replace mutex_lock with mutex_trylock
Date: Wed, 8 Nov 2023 21:14:15 +0900
Message-ID: <1891546521.01699446601660.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJDXg4QMlnaDFKz6mJIV5RzCYoNswIslky8AhUiAhqve6/PoA==
Content-Language: ko
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSvO7iau9Ugw07eCyuXDzEZDH14RM2
	i5eHNC0ufTrPbvHq8C5Gi29XOpgsfv1/xmRx9OJiJouJd1+zW7zc/IbJgctjw+cmNo+ds+6y
	e2xa1cnmMe9koMe3MxNZPPq2rGL02Hy6OoA9issmJTUnsyy1SN8ugSvj+742xoKrIhU/jss2
	MF4Q6GLk4JAQMJG4csi2i5GLQ0hgN6PE3sl3WbsYOYHiEhLfdn5lgbCFJe63HGGFKHrGKPHk
	/W6wIjYBK4m7TVPYQGwRARWJp73rmECKmAUmMklc+HgBrFtIYB2jxNS3HiA2p4CWxJuWfnYQ
	W1jATeLmpwNgzSxAzeuebAYbyitgKfF0400WCFtQ4uTMJ2A2M9CljYe7oWx5ie1v5zBDXKcg
	8fPpMlaII5wkHhy+wQRRIyIxu7ONeQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc9NNiww
	zEst1ytOzC0uzUvXS87P3cQIjj0tjR2M9+b/0zvEyMTBeIhRgoNZSYT3r71HqhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXFewxmzU4QE0hNLUrNTUwtSi2CyTBycUg1MT25c2eE8T9Bw3nW/2/wT
	9Qu17qoccbD4ucUv7clypZMRD/oWdFd+723VZb6bX5hzRe7Ay7urVxiYzIjyF3vq1pdxx8mB
	tUA05YHyzwuH3DhuGXK9j2z6lOcltjE5T5P1kDJ3vDLH3+9Sy9XdG4ODOivkf/34HpKjzakl
	er1mz7f86pou33J7lkq+cLsdO85Y+hn0GDtounX5LXd4KtIpd2vd7gkGUwq8/s5uOGnY8qxX
	12KiZuXHSE+bX7kPd+5ftnT1G171RX0vWtP6X9fl7Dwhfep/1790FdZDxz6kTgthKp7B05fp
	+1Vlps9Jaz4N/R3TkxcxrO7Yr59+JufW/sN/DmlsFPJeYlnbskiJpTgj0VCLuag4EQC4ytvd
	LAMAAA==
X-CMS-MailID: 20231108121427epcas2p258dc03460150a32e64598c4a3b8eb8c7
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf
References: 
 <CGME20231107081810epcas2p27a897426580fce6f0884cffb256b2aaf@epcas2p2.samsung.com>
	<664457955.21699345385931.JavaMail.epsvc@epcpadp4>
	<87y1f9r705.wl-tiwai@suse.de>
Message-ID-Hash: H5JNT7MNYD3FAMM5LACJU6KFTGPGI5S6
X-Message-ID-Hash: H5JNT7MNYD3FAMM5LACJU6KFTGPGI5S6
X-MailFrom: s47.kang@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5JNT7MNYD3FAMM5LACJU6KFTGPGI5S6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Thanks for the patch.  But this change may break the current working
> behavior; e.g. when two proc reads are running concurrently, one would
> be aborted unexpectedly.
> 
> IIUC, the problem is the call of proc_remove(), and this call itself
> can be outside the global mutex.
> 
> Could you check whether the patch below works instead?  (Note that
> it's only compile-tested.)  It makes the proc_remove() called at
> first, then clearing the internal entries.  The function was renamed
> accordingly for avoiding confusion, too.
> 
> 
> Takashi

You are right. My patch is just for avoiding the deadlock. 
It may lead to other problem instead the deadlock(e.g. USB sound card
registration failure)
Your patch works well without any problems.
But I can't confirm that the problem is solved or not.
because the issue has occurred only once until now.
(Test method: USB insertion / removal during a call)


> 
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -56,7 +56,7 @@ struct snd_info_private_data {
>  };
>  
>  static int snd_info_version_init(void);
> -static void snd_info_disconnect(struct snd_info_entry *entry);
> +static void snd_info_clear_entries(struct snd_info_entry *entry);
>  
> /*
>  
> @@ -569,11 +569,16 @@ void snd_info_card_disconnect(struct snd_card *card)
>  {
>  	if (!card)
>  		return;
> -	mutex_lock(&info_mutex);
> +
>  	proc_remove(card->proc_root_link);
> -	card->proc_root_link = NULL;
>  	if (card->proc_root)
> -		snd_info_disconnect(card->proc_root);
> +		proc_remove(card->proc_root->p);
> +
> +	mutex_lock(&info_mutex);
> +	if (card->proc_root)
> +		snd_info_clear_entries(card->proc_root);
> +	card->proc_root_link = NULL;
> +	card->proc_root = NULL;
>  	mutex_unlock(&info_mutex);
> }
>  
> @@ -745,15 +750,14 @@ struct snd_info_entry
*snd_info_create_card_entry(struct snd_card *card,
>  }
>  EXPORT_SYMBOL(snd_info_create_card_entry);
>  
> -static void snd_info_disconnect(struct snd_info_entry *entry)
> +static void snd_info_clear_entries(struct snd_info_entry *entry)
>  {
>  	struct snd_info_entry *p;
>  
>  	if (!entry->p)
>  		return;
>  	list_for_each_entry(p, &entry->children, list)
> -		snd_info_disconnect(p);
> -	proc_remove(entry->p);
> +		snd_info_clear_entries(p);
>  	entry->p = NULL;
>  }
>  
> @@ -770,8 +774,9 @@ void snd_info_free_entry(struct snd_info_entry *
entry)
>  	if (!entry)
>  		return;
>  	if (entry->p) {
> +		proc_remove(entry->p);
>  		mutex_lock(&info_mutex);
> -		snd_info_disconnect(entry);
> +		snd_info_clear_entries(entry);
>  		mutex_unlock(&info_mutex);
>  	}


