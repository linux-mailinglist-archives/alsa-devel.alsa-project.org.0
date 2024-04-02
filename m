Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBD389AF1F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2ACB2BC4;
	Sun,  7 Apr 2024 09:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2ACB2BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474520;
	bh=PbCYgrPVbVOdhV1jC/4KII4virJ8WGK/ifPusT5Ym9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aMxPAICfoGR84f8GJxLBus4E7Ugj7O/dJODdAkaxaK4wqC21cx3V6GwY6jWIKMNbZ
	 Te2lKxC43Zft7LTgQE8ICa9CJokoiS3i5BbdjzYAka26+zo3RbdWCW+IeBimKwzKrr
	 HPDvnDw4JulZ5/FYimJ9akL9mte3b0+9EfIvzZwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0D85F80CB3; Sun,  7 Apr 2024 09:17:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8637F80C7E;
	Sun,  7 Apr 2024 09:17:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7FFF8020D; Tue,  2 Apr 2024 22:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FD3CF8015B
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 22:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FD3CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=f6U0DyP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712090084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmliKS7IXk0y+y9ssPc7arVQxLqF15p8TNQCcmbmlpA=;
	b=f6U0DyP5RTDuDa4zavUrwkOVaS3it37P0oHjHsWeG1Ly6Lg0TSGAlC1XgialT9oJ1I0FwU
	UlaoJD/wMnY2JW+k4Lj4MMY/LgttSBQxtUE7XhRN7Bfk6XJ9qH8xnbkA6zHjFhUMGNrPjz
	XepIrotzXv36o1KlWTgPU9830qQy3o4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-M7s17IMyP86NjAj3PJZL_Q-1; Tue,
 02 Apr 2024 16:34:41 -0400
X-MC-Unique: M7s17IMyP86NjAj3PJZL_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEB671C29EA4;
	Tue,  2 Apr 2024 20:34:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6D640C6DAE;
	Tue,  2 Apr 2024 20:34:37 +0000 (UTC)
Date: Tue, 2 Apr 2024 16:34:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 24/25] fuse: virtio: drop owner assignment
Message-ID: <20240402203418.GG2507314@fedora>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-24-98f04bfaf46a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2TTKZujScqhsi/4"
Content-Disposition: inline
In-Reply-To: <20240331-module-owner-virtio-v2-24-98f04bfaf46a@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-MailFrom: stefanha@redhat.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MP426REXPHKZ2AEGV3CI527OPZ5DQ3QO
X-Message-ID-Hash: MP426REXPHKZ2AEGV3CI527OPZ5DQ3QO
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MP426REXPHKZ2AEGV3CI527OPZ5DQ3QO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--y2TTKZujScqhsi/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2024 at 10:44:11AM +0200, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Depends on the first patch.
> ---
>  fs/fuse/virtio_fs.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--y2TTKZujScqhsi/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmYMa8oACgkQnKSrs4Gr
c8hVnAf/cA3xbyK70jAgkZV9EtimcENA8Vicjc5wwuE2Vt1WSOZUWtD+a8KtqIDS
ICvCIk7XlMHoB7BYaP8qlXQ0kjkARmT7hwEQyqEDL/MzEgyKhChus/pV8g6Cvywl
OdPkT57aujxEBU5+l5t8TnP2I8CziPoDf0uizIpf5r2pZstP0q/mRVNFevjTDeSu
L+LjxHElpmAVApGciiGOH+cpPYuKAejObzy5z92m7jZgh/LfHtcK29bhoWwNTL1l
e6ryz/B2YrpyrVdDjqUD1iJ2WR2qxEUAI3moU5ySGqG/w5Lg0+ji+9TlCE46xoQ/
U1ALdKDyNFUB1iRXdA00oKhEe6MUOw==
=AQF3
-----END PGP SIGNATURE-----

--y2TTKZujScqhsi/4--

