Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175397557A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 16:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F92826;
	Wed, 11 Sep 2024 16:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F92826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726065146;
	bh=gfWKMePXNCFVDvze8VMVK6kMx9WF1reISt4viCSBPNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2MR4wWAnrsSCe2l197gE5OimMgqgpyoQrJN/HOVucgw+JLYO0Ko+qwfoaSNBx+wv
	 9PdaDIH150PY22wMaxf8zg7Kr44xo9N/ozewYdccDMc7iNV6KMJOZOzoWm0PAw4iQ9
	 EtKCkdT4h1Dn3JDzdAf70FUDywDb+PpNbvKtDgso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB01F805BB; Wed, 11 Sep 2024 16:31:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF9DF805B1;
	Wed, 11 Sep 2024 16:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 608D2F801F5; Wed, 11 Sep 2024 16:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9381EF80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 16:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9381EF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=leemhuis.info header.i=@leemhuis.info
 header.a=rsa-sha256 header.s=he214686 header.b=u/+8qiZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=kazUhr9+CMKnxrHDG4LG25lGRvg5PhMm3O1ZvwtY70I=;
	t=1726065109; x=1726497109; b=u/+8qiZ9bzv1UOEp9alY0TfTT1Cc6pn8ZIbmydUn39R40b4
	pYUPt3nkFo+fkvShBZFWSlpgUmWwdrUD9IEojO5WdDwrFjsZd5sG0qhmjguwbbktHmi5gGpVgFleq
	UXLocCYjdHaY1xB1J1CdHJtzT0gR77QTqdv6qUfHOOV9hvLg/U5j5l2k1Ud2PVJaU/c7GGx+KqdpO
	14b82Zbef9yvaD6APyT6PDO9YqPXcoWWb9qA4x3NlYVIv5QFbx2Lu3nHkr7udgd9KzVDj3XNf16zG
	f4ad5kofkJI1zPjIt/TFC3DnZbqzADeDRLVU46YE9h8EV3Mm4vizvhkRUMPjwwTA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1soONj-00022u-U2; Wed, 11 Sep 2024 16:31:44 +0200
Message-ID: <f4c222e2-cf94-44ec-bc69-0ab758bfb3fa@leemhuis.info>
Date: Wed, 11 Sep 2024 16:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
To: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, krzysztof.kozlowski@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
 <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
 <2024091130-detail-remix-34f7@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <2024091130-detail-remix-34f7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1726065109;ac2ccdb3;
X-HE-SMSGID: 1soONj-00022u-U2
Message-ID-Hash: E7DQLK2AMWJKNUAU7S5MXLTXWJTYFEHG
X-Message-ID-Hash: E7DQLK2AMWJKNUAU7S5MXLTXWJTYFEHG
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7DQLK2AMWJKNUAU7S5MXLTXWJTYFEHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11.09.24 14:31, Greg KH wrote:
> On Tue, Sep 10, 2024 at 04:02:29PM +0300, Péter Ujfalusi wrote:
>>> The reverted patch causes major regression on soundwire causing all audio
>>> to fail.
>>> Interestingly the patch is only in 6.10.8 and 6.10.9, not in mainline or linux-next.
> 
> Really?  Commit ab8d66d132bc ("soundwire: stream: fix programming slave
> ports for non-continous port maps") is in Linus's tree, why isn't it
> being reverted there first?

FWIW, the revert should land in mainline tomorrow afaics:
https://lore.kernel.org/all/ZuFcBcJztAgicjNt@vaman/

BTW, in case anyone cares: I think this is another report about the
problem, this time with 6.6.y:
https://bugzilla.kernel.org/show_bug.cgi?id=219256

Ciao, Thorsten
