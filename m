Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8A894BFD
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379EA2C45;
	Tue,  2 Apr 2024 08:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379EA2C45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041184;
	bh=NZdy0X3liUqTEzRbInNe/vjDY6MNb1re1WUM40McVv8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r92DtXHow8Cu86pM0DxeL18ScsqwiIiYvIC+lE9JoYrzW/8EjKCcsaKDthKJTCdbp
	 FkiHiIbkM9T2XOF25/fKrEbbXrRTfr9icarpGZQzZ8dcq2WDL8j4KF9ZEmRnBrLhXF
	 EnRn6F/bmc4Bh+m4fke1JmnLnay9KGZt6bt4nHXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B541F806D1; Tue,  2 Apr 2024 08:52:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CE3DF8085A;
	Tue,  2 Apr 2024 08:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F03F8025F; Wed, 27 Mar 2024 14:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D2CDF80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 14:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2CDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.a=rsa-sha256 header.s=mail header.b=a/niE7zJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=NZdy0X3liUqTEzRbInNe/vjDY6MNb1re1WUM40McVv8=;
	t=1711546487; x=1712756087; b=a/niE7zJEYdLklt3mwoNIrsc6oMk2RMT3zRr1c+JEnPSJnS
	2as+XyLIutyWmQ6t9Wx5MgEAOIvE7CstjaP7Zt/QG8ujRQRqRksFRacuyvJfoVAjx5dh+0BAN4VFK
	habA8ZkCBAJ15Z47/hDkYOqwFiNlDEsQRrg27b5do4pEjGVt71596aXF7qAw38pldwI7mgW7wjzE5
	sQTF8cb+/X2woihC/wGATcTWijwHLR6CO7evdRIgrV2cWoQuObghk17qfOLp3u54NSJJ0KqrarF6h
	bLJZK+yNyKCjPL5gpKvu6HU7FsxcR885SJqqwIkO+IjLoXw6nKB8EsoUVJVa1Nfg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpTPq-0000000H6pw-3l9Q;
	Wed, 27 Mar 2024 14:34:07 +0100
Message-ID: <46e9539f59c82762e3468a9519fa4123566910d5.camel@sipsolutions.net>
Subject: Re: [PATCH 02/22] um: virt-pci: drop owner assignment
From: Johannes Berg <johannes@sipsolutions.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe
 <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von
 Dentz <luiz.dentz@gmail.com>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, David
 Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Joerg Roedel
 <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar
 Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,  Stefano Garzarella
 <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Pankaj Gupta
 <pankaj.gupta.linux@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Vivek Goyal <vgoyal@redhat.com>, Miklos
 Szeredi <miklos@szeredi.hu>, Anton Yakovlev
 <anton.yakovlev@opensynergy.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev,  linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org
Date: Wed, 27 Mar 2024 14:34:04 +0100
In-Reply-To: <20240327-module-owner-virtio-v1-2-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
	 <20240327-module-owner-virtio-v1-2-0feffab77d99@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-MailFrom: johannes@sipsolutions.net
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 4T42NDIX35HZ6E4WZQ62J4EA4LNDP5HM
X-Message-ID-Hash: 4T42NDIX35HZ6E4WZQ62J4EA4LNDP5HM
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:50:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 2024-03-27 at 13:40 +0100, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.

> All further patches depend on the first virtio patch, therefore please ac=
k
> and this should go via one tree: virtio?

Sure. Though it's not really actually necessary, you can set it in the
core and merge the other patches in the next cycle; those drivers that
_have_ an .owner aren't broken after all.

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes
