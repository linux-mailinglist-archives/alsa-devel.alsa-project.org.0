Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54E991BDD
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 03:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7FA8857;
	Sun,  6 Oct 2024 03:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7FA8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728179790;
	bh=/4L+Waftv30hJTd8pHAaY7MDs2ik61gNjRPrwI78SK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QaTm8uINloqmpLxv4eSjCKL3ZaKWz1wKI4YvUc8SCc2sFiRis+xWCQoeXJbEa16iM
	 5GCDWQlcLizWi1Che3qSj3WHoD1Dg/CBzKIWrk+UeppXTrtCU6EPAuQGy2xWlrVyBe
	 7zpL/c/FQqf3USHo/YN9HFACsk1Mp1ceOlpUhSFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAC64F8059F; Sun,  6 Oct 2024 03:55:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C0F7F8057A;
	Sun,  6 Oct 2024 03:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A359CF80528; Sun,  6 Oct 2024 03:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7402F80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 03:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7402F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bHJhnSlc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86C2A5C55E1;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DCC4CEC2;
	Sun,  6 Oct 2024 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179745;
	bh=/4L+Waftv30hJTd8pHAaY7MDs2ik61gNjRPrwI78SK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHJhnSlcDypCxKXc9/0e8sSwcsPUcNs5OrzLmNK372VoYuGepvQT+MeJe7gZxz24S
	 Td8OetlGIX6VQqxeo+oLpBwCwYCr2xh0kr7HWG2dWxJwS9C9I5+F0Ozm3XgnvgOi6R
	 eyo7cMIiqgZ5im6lRwsEC9egd6IBXTkhxhVOAfSeJ6SqQ1OAUWk36taYJoiLw9dpJ9
	 1TD2kMI24gaTyunNoaEycYfyV8WJ6EL2ZaaiP5SsbbYsVWCcKHV7TrlwKb7lUEYqTY
	 l48kzmdHzTLb/dBfgaSN3gUHXAeR3ENezjiB4lZZ+5JAICFVxSM/ycZNnlcwg/pUoP
	 0Njb/XOnUh7ew==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-gpio@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org,
	audit@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	dccp@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	drbd-dev@lists.linbit.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-leds@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	tipc-discussion@lists.sourceforge.net,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Date: Sat,  5 Oct 2024 20:55:35 -0500
Message-ID: <172817973322.398361.12931602917664759173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBOPOQZBRIOI7UIMM3ZDMMP3GOA2PJOV
X-Message-ID-Hash: TBOPOQZBRIOI7UIMM3ZDMMP3GOA2PJOV
X-MailFrom: andersson@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBOPOQZBRIOI7UIMM3ZDMMP3GOA2PJOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[24/35] soc: qcom: qmi: Reorganize kerneldoc parameter names
        commit: eea73fa08e69fec9cdc915592022bec6a9ac8ad7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
